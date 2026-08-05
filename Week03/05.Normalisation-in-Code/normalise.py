import csv
import sqlite3
import os

def main():
    print("1. Reading unnormalised raw data (1NF/0NF) from data.csv...")
    raw_data = []
    
    # Check if the file exists before attempting to open
    if not os.path.exists('data.csv'):
        print("Error: data.csv not found in the current directory.")
        return

    with open('data.csv', 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            raw_data.append(row)
            
    print(f"Loaded {len(raw_data)} redundant records.\n")
    
    db_file = 'university.db'
    # Connect to SQLite (creates the file if it doesn't exist)
    conn = sqlite3.connect(db_file)
    cursor = conn.cursor()
    
    print("2. Setting up 3NF relational tables in SQLite...")
    # Using executescript for multiple statements
    cursor.executescript('''
        DROP TABLE IF EXISTS Enrollments;
        DROP TABLE IF EXISTS Courses;
        DROP TABLE IF EXISTS Instructors;
        DROP TABLE IF EXISTS Students;
        
        -- 3NF: Students table
        -- The student name depends strictly on the primary key (StudentID)
        CREATE TABLE Students (
            StudentID INTEGER PRIMARY KEY,
            StudentName TEXT
        );
        
        -- 3NF: Instructors table
        -- Extracted from Courses to eliminate transitive dependencies
        -- InstructorEmail depends strictly on the Instructor
        CREATE TABLE Instructors (
            InstructorName TEXT PRIMARY KEY,
            InstructorEmail TEXT
        );
        
        -- 3NF: Courses table
        -- Removed partial dependencies (course details depend strictly on CourseID)
        -- Transitive dependency (InstructorEmail) replaced by a foreign key
        CREATE TABLE Courses (
            CourseID TEXT PRIMARY KEY,
            CourseName TEXT,
            InstructorName TEXT,
            Room TEXT,
            FOREIGN KEY (InstructorName) REFERENCES Instructors (InstructorName)
        );
        
        -- The intersection table linking Students and Courses
        -- Resolves the many-to-many relationship
        CREATE TABLE Enrollments (
            StudentID INTEGER,
            CourseID TEXT,
            PRIMARY KEY (StudentID, CourseID),
            FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
            FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
        );
    ''')
    
    print("3. Cleansing and normalising data programmatically...")
    
    # Dictionaries to maintain unique records across our normal forms
    students = {}
    instructors = {}
    courses = {}
    enrollments = set() # use a set for unique pairs
    
    for row in raw_data:
        sid = int(row['StudentID'])
        
        # Populate unique Students
        students[sid] = row['StudentName']
        
        # Populate unique Instructors
        instructors[row['Instructor']] = row['InstructorEmail']
        
        # Populate unique Courses
        courses[row['CourseID']] = {
            'name': row['CourseName'],
            'instructor': row['Instructor'],
            'room': row['Room']
        }
        
        # Populate Enrollments mapping
        enrollments.add((sid, row['CourseID']))
        
    print(f"Extraction results: {len(students)} Students, {len(instructors)} Instructors, {len(courses)} Courses, {len(enrollments)} Enrollments.\n")

    print("4. Inserting normalized data into SQLite tables...")
    
    for sid, sname in students.items():
        cursor.execute("INSERT INTO Students (StudentID, StudentName) VALUES (?, ?)", (sid, sname))
        
    for iname, email in instructors.items():
        cursor.execute("INSERT INTO Instructors (InstructorName, InstructorEmail) VALUES (?, ?)", (iname, email))
        
    for cid, cinfo in courses.items():
        cursor.execute("INSERT INTO Courses (CourseID, CourseName, InstructorName, Room) VALUES (?, ?, ?, ?)", 
                       (cid, cinfo['name'], cinfo['instructor'], cinfo['room']))
                       
    for sid, cid in enrollments:
        cursor.execute("INSERT INTO Enrollments (StudentID, CourseID) VALUES (?, ?)", (sid, cid))
        
    conn.commit()
    print("Data successfully committed.\n")
    
    print("5. Verification Query: Reconstructing flat dataset through SQL JOINs")
    print("-" * 75)
    print(f"{'Student':<15} | {'Course':<18} | {'Instructor':<15} | {'Email'}")
    print("-" * 75)
    
    cursor.execute('''
        SELECT s.StudentName, c.CourseName, i.InstructorName, i.InstructorEmail
        FROM Enrollments e
        JOIN Students s ON e.StudentID = s.StudentID
        JOIN Courses c ON e.CourseID = c.CourseID
        JOIN Instructors i ON c.InstructorName = i.InstructorName
        ORDER BY s.StudentName, c.CourseName
    ''')
    
    for row in cursor.fetchall():
        print(f"{row[0]:<15} | {row[1]:<18} | {row[2]:<15} | {row[3]}")
        
    conn.close()

if __name__ == '__main__':
    main()
