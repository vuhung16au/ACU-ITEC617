# Week 2 - Topic 1: The "Business Rule to SQL" Translation Challenge

## Overview
This activity focuses on Translating Business Rules, diving deep into Attributes, and selecting Primary Keys.

## The Setup
We are modeling a database for a local veterinary clinic based on the following raw, unstructured business rules:

> "We need to track all our pets. We need their name, birthdate, and weight. Oh, and whether they are a dog, cat, or bird."

> "Every pet has an owner. We need the owner's first name, last name, phone number, and a backup phone number if they have one."

> "We need a unique way to identify every pet, but animal names aren't unique. Same with owners, we need a unique ID for them."

## The Hands-on Task
Students are required to complete the following:

1. **Attribute Classification:** Identify the attributes from the text and classify them. For example:
   - `Weight` is a single-valued attribute.
   - `BackupPhoneNumber` is an optional/multi-valued attribute.
   - `Age` is a derived attribute calculated from `Birthdate`.

2. **Key Selection:** Decide on the Primary Key strategy. Will they use a Natural Key (Phone Number for owners?) or generate a Surrogate Key (OwnerID, PetID)?

3. **SQL Translation:** Write the `CREATE TABLE` statements for `Owners` and `Pets`. They must use the correct data types based on their attribute analysis (e.g., `DATE` vs `VARCHAR`) and declare the Primary Keys.

The provided `init-scripts/01-init.sql` file contains a reference implementation for this challenge.
