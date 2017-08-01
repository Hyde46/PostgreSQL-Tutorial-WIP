###############################################################################
#####################  Rikes PostgreSQL Tutorial ##############################
###############################################################################

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- This files constains all queries, that will be used to show
-- Rike how to join tables and use the resulting queries for awesome stuff
-------------------------------------------------------------------------------
-- What you are supposed to learn after the completion of the tutorial:
--
--  1. Cool join-stuff
--  2. ?
--  3. ?
--  4. Profit!
--
-- Thats all you ever need !

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Chapter 2: All of the JOINs
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Suppose we have two tables. One of them holds information about humans
-- like their name, age and a pet they own and whether they even like pets. (But who doesnt like pets?)
-- The Other relation holds information about our beloved animal companions, like its name, type,
-- whether it prefers outdoors or indoors and its age.
DROP TABLE IF EXISTS Human;
CREATE TABLE Human(
  name TEXT,
  owns TEXT,
  age INTEGER,
  likes_pets BOOLEAN
);
DROP TABLE IF EXISTS Animal
CREATE TABLE Animal(
  name TEXT,
  type TEXT,
  age INTEGER,
  likes_indoors BOOLEAN,
  is_pet BOOLEAN
);
--TODO: populate tables

-- Now for each human that has  a pet, we want to know the type of the pet and
-- whether it likes indoors or not. To get this kind of result we need
-- information from both relations Human and Animal.
-- We combine the two by JOINing them
SELECT *
FROM Human AS h, Animal AS a;
-- As you can see the resulting table has the same number of columns as both
-- tables combined. We are creating a result based on a cross product of the
-- two relations. Human X Animal. Every Row by Human is matched with Every
-- Row by Animal.
-- To recieve the desired output we need to filter the large resulting table for
-- the rows where human.owns is the same as the name of the animal itself.
SELECT *
FROM Human AS h, Animal AS a
WHERE h.owns = a.name;
-- Thereby we are JOINing the two tables on the attributes h.owns and a.name.
-- Alternate query form resulting in the same table:
SELECT *
FROM Human AS h, Animal AS a
JOIN ON (h.owns = a.name);
