# Week 2 - Topic 3: Identifying the Weak Link

## Overview
This activity focuses on Relationship Strength, specifically distinguishing between Strong vs Weak Entities, and implementing Composite Primary Keys.

## The Setup
We are analyzing the business rules for a national hotel chain:

> "We have many hotels across the country. Each hotel has a unique HotelID, a name, and a city."

> "Each hotel has many rooms. The rooms are numbered 101, 102, 201, etc. However, Room 101 exists in the Sydney hotel, and Room 101 also exists in the Melbourne hotel."

## The Hands-on Task
Students are required to work through the following analysis and implementation:

1. **Analysis:** Can `RoomNumber` alone be the Primary Key for the `Rooms` table? 
   * *Answer:* No, because it is not unique across the entire database (multiple hotels can have a room 101).

2. **Identification:** Identify `Rooms` as a **Weak Entity**. It cannot be uniquely identified without its parent entity (`Hotels`). Therefore, the relationship between `Hotels` and `Rooms` is an identifying (strong) relationship.

3. **SQL Implementation:** Write the `CREATE TABLE` SQL statements for the `Rooms` table. The solution requires defining a **Composite Primary Key** using both the Foreign Key (`HotelID`) and the partial key (`RoomNumber`).

The provided `init-scripts/01-init.sql` file contains a reference implementation for this challenge.
