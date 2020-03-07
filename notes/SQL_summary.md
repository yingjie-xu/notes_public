# SQL_summary

```sql
SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
FROM mytable
    JOIN another_table
      ON mytable.column = another_table.column
    WHERE constraint_expression
    GROUP BY column
    HAVING constraint_expression
    ORDER BY column ASC/DESC
    LIMIT num_limit OFFSET num_offset;
```

## Query order of execution

1. **`FROM` and `JOIN`s:** determine the total working set of data that is being queried. 
2. **`WHERE`:** constraints are applied to the individual rows, and rows that do not satisfy the constraint are discarded. Aliases in the `SELECT` part of the query are not accessible 
3. **`GROUP BY`:** As a result of the grouping, there will only be unique values in that column. Implicitly, this means that you should only need to use this when you have *aggregate functions* in your query.
4. **`HAVING`:** If the query has a `GROUP BY` clause, then the constraints in the `HAVING` clause are then applied to the grouped rows, discard the grouped rows that don't satisfy the constraint.
5. **`SELECT`:** select required columns from table
6. **`DISTINCT`:** remove duplicated rows
7. **`UNION` \ `INTERSECTION` \ `EXCEPT` \ `UNION ALL`:** `ALL` keyword is used to allow duplicates
8. **`ORDER BY`:** order by ...
9. **`LIMIT \ OFFSET`:** limit to show only few rows (could also apply the offset)



### Constraints

| Operator            | Condition                                            | SQL Example                           |
| ------------------- | ---------------------------------------------------- | ------------------------------------- |
| =, !=, < <=, >, >=  | Standard numerical operators                         | col_name **!=** 4                     |
| BETWEEN … AND …     | Number is within range of two values (inclusive)     | col_name **BETWEEN** 1.5 **AND** 10.5 |
| NOT BETWEEN … AND … | Number is not within range of two values (inclusive) | col_name **NOT BETWEEN** 1 **AND** 10 |
| IN (…)              | Number exists in a list                              | col_name **IN** (2, 4, 6)             |
| NOT IN (…)          | Number does not exist in a list                      | col_name **NOT IN** (1, 3, 5)         |



| Operator   | Condition                                                    | Example                                                      |
| ---------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| =          | <u>***Case sensitive***</u> exact string comparison (*notice the single equals*) | col_name **=** "abc"                                         |
| != or <>   | ***<u>Case sensitive</u>*** exact string inequality comparison | col_name **!=** "abcd"                                       |
| LIKE       | Case insensitive exact string comparison                     | col_name **LIKE** "ABC"                                      |
| NOT LIKE   | Case insensitive exact string inequality comparison          | col_name **NOT LIKE** "ABCD"                                 |
| %          | Used anywhere in a string to match a sequence of zero or more characters (only with LIKE or NOT LIKE) | col_name **LIKE** "%AT%" (matches "AT", "ATTIC", "CAT" or even "BATS") |
| _          | Used anywhere in a string to match a single character (only with LIKE or NOT LIKE) | col_name **LIKE** "AN_" (matches "AND", but not "AN")        |
| IN (…)     | String exists in a list                                      | col_name **IN** ("A", "B", "C")                              |
| NOT IN (…) | String does not exist in a list                              | col_name **NOT IN** ("D", "E", "F")                          |



### JOIN

- The `INNER JOIN` is a process that matches rows from the first table and the second table which have the same key (as defined by the `ON` constraint) to create a result row with the combined columns from both tables. 
- When joining table A to table B, a `LEFT JOIN` simply includes rows from A regardless of whether a matching row is found in B. The `RIGHT JOIN` is the same, but reversed, keeping rows in B regardless of whether a match is found in A. Finally, a `FULL JOIN` simply means that rows from both tables are kept, regardless of whether a matching row exists in the other table.



### NULL

Sometimes, it's also not possible to avoid `NULL` values, as we saw in the last lesson when outer-joining two tables with asymmetric data. In these cases, you can test a column for `NULL` values in a `WHERE` clause by using either the `IS NULL` or `IS NOT NULL` constraint.



### Expressions

```sql
-- rename with `AS`
SELECT particle_speed / 2.0 AS half_particle_speed
FROM physics_data
WHERE ABS(particle_position) * 10.0 > 500;

SELECT col_expression AS expr_description, …
FROM mytable;
```



### Aggregate functions

| Function                                | Description                                                  |
| --------------------------------------- | ------------------------------------------------------------ |
| **COUNT(*****)**, **COUNT(**column**)** | A common function used to counts the number of rows in the group if no column name is specified. Otherwise, count the number of rows in the group with non-NULL values in the specified column. |
| **MIN(**column)                         | Finds the smallest numerical value in the specified column for all rows in the group. |
| **MAX(**column)                         | Finds the largest numerical value in the specified column for all rows in the group. |
| **AVG(**column)                         | Finds the average numerical value in the specified column for all rows in the group. |
| **SUM(**column)                         | Finds the sum of all numerical values in the specified column for the rows in the group. |



### Operations

```sql
-- insert rows
INSERT INTO mytable
VALUES (value_or_expr, another_value_or_expr, …);
       
INSERT INTO mytable
(column, another_column, …)
VALUES (value_or_expr, another_value_or_expr, …);

-- update rows
UPDATE mytable
SET column = value_or_expr, 
    other_column = another_value_or_expr, 
    …
WHERE condition;

-- delete rows
DELETE FROM mytable
WHERE condition;

-- create table
CREATE TABLE mytable (
    column DataType TableConstraint DEFAULT default_value,
    another_column DataType TableConstraint DEFAULT default_value,
    …
);

-- altering table
ALTER TABLE mytable
ADD column DataType OptionalTableConstraint 
    DEFAULT default_value;
    
ALTER TABLE mytable
DROP column_to_be_deleted;

ALTER TABLE mytable
RENAME TO new_table_name;

-- drop
DROP TABLE mytable;
```



### Data types

| Data type                                                    | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| `INTEGER`, `BOOLEAN`                                         | The integer datatypes can store whole integer values like the count of a number or an age. In some implementations, the boolean value is just represented as an integer value of just 0 or 1. |
| `FLOAT`, `DOUBLE`, `REAL`                                    | The floating point datatypes can store more precise numerical data like measurements or fractional values. Different types can be used depending on the floating point precision required for that value. |
| `CHARACTER(num_chars)`, `VARCHAR(num_chars)`, `TEXT`         | The text based datatypes can store strings and text in all sorts of locales. The distinction between the various types generally amount to underlaying efficiency of the database when working with these columns. Both the CHARACTER and VARCHAR (variable character) types are specified with the max number of characters that they can store (longer values may be truncated), so can be more efficient to store and query with big tables. |
| `DATE`, `DATETIME`                                           | SQL can also store date and time stamps to keep track of time series and event data. They can be tricky to work with especially when manipulating data across time zones. |
| `BLOB`                                                       | Finally, SQL can store binary data in blobs right in the database. These values are often opaque to the database, so you usually have to store them with the right metadata to re-query them. |
| Docs: [MySQL](http://dev.mysql.com/doc/refman/5.6/en/data-types.html), [Postgres](http://www.postgresql.org/docs/9.4/static/datatype.html), [SQLite](https://www.sqlite.org/datatype3.html), [Microsoft SQL Server](https://msdn.microsoft.com/en-us/library/ms187752.aspx) |                                                              |



### Constraints

| Constraint           | Description                                                  |
| -------------------- | ------------------------------------------------------------ |
| `PRIMARY KEY`        | This means that the values in this column are unique, and each value can be used to identify a single row in this table. |
| `AUTOINCREMENT`      | For integer values, this means that the value is automatically filled in and incremented with each row insertion. Not supported in all databases. |
| `UNIQUE`             | This means that the values in this column have to be unique, so you can't insert another row with the same value in this column as another row in the table. Differs from the `PRIMARY KEY` in that it doesn't have to be a key for a row in the table. |
| `NOT NULL`           | This means that the inserted value can not be `NULL`.        |
| `CHECK (expression)` | This allows you to run a more complex expression to test whether the values inserted are valid. For example, you can check that values are positive, or greater than a specific size, or start with a certain prefix, etc. |
| `FOREIGN KEY`        | This is a consistency check which ensures that each value in this column corresponds to another value in a column in another table.  For example, if there are two tables, one listing all Employees by ID, and another listing their payroll information, the `FOREIGN KEY` can ensure that every row in the payroll table corresponds to a valid employee in the master Employee list. |



# Database

block = unit of transfer for disk read/write = page

| Structure of DB              |
| ---------------------------- |
| SQL Client                   |
| Query parsing & optimization |
| Relational operators         |
| Files and Index management   |
| Buffer management            |
| Disk Space management        |

**Disk Space Management:**

- **Lowest layer of DBMS, manages space on disk**
- **Purpose:** 
  - Map pages to locations on disk
  - Load pages from disk to memory
  - Save pages back to disk & ensuring writes

- Higher levels call upon this layer to:
  - Read/write a page
  - Allocate/de-allocate logical pages



Sloted Pages:

file contain pages and pages contain records

pages are managed

- on disk by disk space manager
- in memory by buffer manager



File Organizations:

- Heap Files: Suitable when typical access is a full scan of all records

- Sorted Files: Best for retrieval in order, or when a range of records is needed

- Clustered Files & Indexes: Group data into blocks to enable fast lookup and efficient modifications.





