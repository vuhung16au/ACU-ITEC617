# Weak Entities and Composite Primary Keys

When modeling data, not all entities are created equal. Some can stand on their own, while others depend entirely on another entity. Understanding this distinction is crucial for proper database design.

## Strong vs. Weak Entities

*   **Strong Entity:** An entity that exists independently of other entities. It has its own unique Primary Key that can uniquely identify its records without any outside help. For example, a `Hotel` can be identified uniquely by its system-generated `HotelID`.
*   **Weak Entity:** An entity whose existence depends on a parent entity. More importantly, it cannot be uniquely identified by its own attributes alone. For example, a `Room` with `RoomNumber = 101` means nothing unless we know *which* hotel that room belongs to.

## Identifying Relationships

The relationship between a Strong (parent) entity and a Weak (child) entity is called an **Identifying Relationship**. This means the child entity's identity is partially derived from the parent. 

In terms of database implementation, this means the Foreign Key pointing to the parent is not just a standard Foreign Key—it actually becomes part of the Weak Entity's Primary Key.

## Composite Primary Keys

A **Composite Primary Key** is a primary key that consists of two or more columns. For a Weak Entity, its composite primary key is formed by combining:
1.  **The Foreign Key** from the parent entity.
2.  **A Partial Key (or Discriminator)** from the weak entity itself.

In our hotel example, `RoomNumber` is the partial key. It's unique *within* a specific hotel, but not across the entire database. By combining `HotelID` and `RoomNumber` into a Composite Primary Key, we can uniquely identify every room in our system (e.g., Hotel 1, Room 101 vs. Hotel 2, Room 101).
