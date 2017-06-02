###############################################################################
#####################  Rikes PostgreSQL Tutorial ##############################
###############################################################################

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- This files constains all queries, that will be used to show
-- Rike all the basic and cool SQL stuff
-------------------------------------------------------------------------------
-- What you are supposed to learn after the completion of the tutorial:
--
--  1. Cool stuff
--  2. ?
--  3. ?
--  4. Profit!
--
-- Thats all you ever need !

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Chapter 1: SQL BASICS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structured Query Language (SQL) is a database language to define
-- datastructures in relational Databases. It also alows us to manage that data
-- in relational databse management systems ( RDMS )
--
-- Short Q&A
--
-- Q:"Denis, what do we find in a Relational Database?"
-- A:"Rike, Relational data is located in the database in form of tables ,like
--    this:"
--
--  Table: Animal companions
--  +------------+-----------------+----------------------+
--  |animal TEXT |occupation TEXT  |usable as pet BOOLEAN |   <--- schema
--  +------------+-----------------+----------------------+
--  |    dog     |  being cute     |    t                 |
--  |    otter   |  being cute     |    f                 | <--- state / instance
--  |    cat     |  being mean     |    t                 |
--  |    Mammoth |being nonexistant|    f                 |
--  +------------+-----------------+----------------------+
--
-- This is a Table describing possible animal companions.
-- We have three (3) columns defined by the schema which describe the type of
-- the Table. Therefor the Type t of the Table Animal compaonions is
-- t(TEXT,TEXT,BOOLEAN)
-- Eacht type has a name as a descritpion of whatever it wants to represent

-- We can add the Table to our database with the following QUERY
CREATE TABLE Animal_Companions(
  animal TEXT,
  occupation TEXT,
  is_pet BOOLEAN
);
-- If we look into the table we can't find any entries
TABLE Animal_Companions;
--Now if we populate the Table, the same QUERY returns a different result
INSERT INTO Animal_Companions VALUES
('dog','being cute',true),
('otter','being cute',false),
('cat','being mean',1::BOOLEAN),
('mammoth','being nonexistant','false'::BOOLEAN);
-- Take a look at the table entries again
table Animal_Companions;
-- Capitalisation of letters does not matter btw. So
-- TABLE <table name>
-- table <table name>
-- is acceptable

-- If for any reason you'd like to remove the whole table from your database
-- system (I don't know why you would want to do that... poor animal companions)
-- Use the following QUERY
DROP TABLE Animal_Companions;
-- Or if you only want to remove all the entries but keep the table Structured
TRUNCATE TABLE Animal_Companions;
--------------------------------------------------------------------------------
-- Considering Rike only wants to choose a pet from the animals which are suited
-- to be a pet at all ( see is_pet column ), only those should be displayed.
-- Makes the descision easier!

-- To reach this goal, you need to filter all your table entries for the
-- suitable pets ( is_pet is true )
-- We use a
------------
-- SELECT
-- FROM
-- WHERE
-----------
-- query structure. This sekeleton of a sctructure will be used for almost all
-- queries on your database system.
-- To visualize easier, read it in the following order, since it will also be
-- executed in that order:
-- (1)FROM, (2)WHERE, (3)SELECT
--
-- (1)FROM:
-- This part chooses the Table(s) at whom we are looking at. Only data from
-- these tables will be accesible in the rest of the query.
-- The RDMS iterates through each ROW in the TABLE.
-- If more than one table is selected in the FROM part, the RDMS will calculate
-- a cross product (x) of each row of each table
-- FROM AxBxCx...xZ

-- (2)WHERE:
-- This is our FILTER for the table. Each ROW we get by the FROM part will be
-- applied to the FILTER specified after WHERE.
-- If the FILTER returns a TRUE to a specific ROW, we can use it in the SELECT
-- part later.

-- (3)SELECT:
-- This part chooses which columns we want to display in the query result.
-- Each result of a query is also a table.

-- Back to Rikes potential animal companions.
-- QUERY: "Show each animal companion if it is suitable as a pet. Dont display
--           whether it is mean or not."
SELECT companion.animal             -- Only take the "animal" column of the
                                    -- "compaion" row

FROM Animal_Companions AS companion -- bind each row shortly to the "companion"
                                    -- handle

WHERE companion.is_pet;             -- check if the "is_pet" column of the
                                    -- "compaion" row is true. dont take any
                                    -- "false" contenders.

-- Since mammoths are not suitable as pets, since they are extinct (duh!)
-- We should remove it from our table. To achieve this we also need to use FILTERS
DELETE FROM Animal_Companions as companion
WHERE companion.occupation = 'being nonexistant'; -- Same FILTER logic as above
