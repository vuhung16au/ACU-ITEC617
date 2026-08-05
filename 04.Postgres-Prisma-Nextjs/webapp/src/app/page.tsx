import prisma from '@/lib/prisma';

export default async function Home() {
  let students: any[] = [];
  let courses: any[] = [];
  let error: string | null = null;

  try {
    // Fetch data using Prisma Client
    students = await prisma.students.findMany({
      include: {
        enrollments: {
          include: {
            courses: true,
          },
        },
      },
    });

    courses = await prisma.courses.findMany();
  } catch (err: any) {
    error = err.message || 'Failed to connect to the database.';
  }

  return (
    <div className="min-h-screen bg-gray-50 p-8 font-sans text-gray-900">
      <div className="max-w-5xl mx-auto space-y-8">
        <header className="bg-white p-6 rounded-lg shadow-sm border border-gray-100 flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold text-gray-800">ITEC617: Database Systems</h1>
            <p className="text-gray-500 mt-1">ORM Implementation Example with Prisma & Next.js</p>
          </div>
          <div className="hidden sm:block text-right">
            <span className="inline-flex items-center rounded-md bg-green-50 px-2.5 py-1 text-sm font-medium text-green-700 ring-1 ring-inset ring-green-600/20">
              Database Connected
            </span>
          </div>
        </header>

        {error && (
          <div className="bg-red-50 border-l-4 border-red-400 p-4 rounded-md">
            <div className="flex">
              <div className="ml-3">
                <p className="text-sm text-red-700">
                  <span className="font-bold">Database Error:</span> {error}
                </p>
                <p className="text-xs text-red-500 mt-1">Make sure you have run `make up` to start the PostgreSQL container.</p>
              </div>
            </div>
          </div>
        )}

        <main className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Students Section */}
          <section className="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
            <h2 className="text-xl font-semibold border-b pb-2 mb-4 text-gray-700">Students ({students.length})</h2>
            {students.length === 0 && !error ? (
              <p className="text-gray-500 italic">No students found.</p>
            ) : (
              <ul className="space-y-4">
                {students.map((student) => (
                  <li key={student.id} className="p-4 bg-gray-50 rounded-md border border-gray-200">
                    <div className="flex justify-between items-start mb-2">
                      <span className="font-medium text-lg">{student.first_name} {student.last_name}</span>
                      <span className="text-xs text-gray-500 bg-gray-200 px-2 py-1 rounded-full">{student.city}</span>
                    </div>
                    <div className="text-sm text-gray-600 mb-3">{student.email}</div>
                    
                    <div className="text-sm">
                      <span className="font-medium text-gray-700">Enrollments:</span>
                      {student.enrollments.length > 0 ? (
                        <ul className="mt-1 space-y-1 list-disc list-inside text-gray-600">
                          {student.enrollments.map((e: any) => (
                            <li key={e.id}>
                              {e.courses?.course_code} - {e.courses?.course_name} <span className="text-xs text-gray-400">({e.semester})</span>
                            </li>
                          ))}
                        </ul>
                      ) : (
                        <span className="text-gray-500 italic ml-2">None</span>
                      )}
                    </div>
                  </li>
                ))}
              </ul>
            )}
          </section>

          {/* Courses Section */}
          <section className="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
            <h2 className="text-xl font-semibold border-b pb-2 mb-4 text-gray-700">Courses ({courses.length})</h2>
            {courses.length === 0 && !error ? (
              <p className="text-gray-500 italic">No courses found.</p>
            ) : (
              <ul className="space-y-3">
                {courses.map((course) => (
                  <li key={course.id} className="flex justify-between items-center p-3 bg-blue-50 border border-blue-100 rounded-md">
                    <div>
                      <span className="font-bold text-blue-800">{course.course_code}</span>
                      <span className="text-blue-900 ml-2">{course.course_name}</span>
                    </div>
                    <span className="text-sm font-medium bg-blue-200 text-blue-800 px-2 py-1 rounded-md">{course.credits} credits</span>
                  </li>
                ))}
              </ul>
            )}
          </section>
        </main>
      </div>
    </div>
  );
}
