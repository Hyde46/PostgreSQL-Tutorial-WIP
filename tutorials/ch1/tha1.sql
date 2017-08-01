-------------------------------------------------------------------------------
-- Totally Hard Assignment ( THA ) No. 1:
-- Due: whenever you want
-------------------------------------------------------------------------------
-- Given the table Animal_Companions defined as
DROP TABLE IF EXISTS Animal_Companions;
CREATE TABLE Animal_Companions(
  animal_name TEXT, -- The name of the animal, given by the owner.
                    -- Or chosen by itself
  animal_type TEXT, -- type in {Dog, cat, mammoth, otter, parrot}
  owner TEXT,
  occupation TEXT,
  is_pet BOOLEAN
);
-- We populate he Table as follows
INSERT INTO Animal_Companions(animal_name,animal_type,owner,occupation,is_pet) VALUES
('Scooby','dog','Shaggy','being investigative',true),
('Wilhelm','otter','Rike','being cute',true),
('Mike','cat','Denis','being mean',true),
('Manfred','mammoth',NULL,'being nonexistant',false),
('Sad Dog','dog',NULL,'being cute',true);

-------------------------------------------------------------------------------
--a)
--You are very interested in all the dogs that exist.
-- Rike just wants to see dogs. All of them !
--List every animal name, its owner and its occupation which is of animal_type dog.

-------------------------------------------------------------------------------
--b)
--Since Rike is not sure about the kind of animals Denis owns, she wants to
--compare hers to his.
--List every animal name, type and its owner which is
-- owned either by Rike or by Denis

-------------------------------------------------------------------------------
--c)
--Finally Rike has time to get a Pet for herself.
--List every Animal type, name and occupation which is a potential pet and not owned by anyone
--The animal has to be cute of course.
--Hint( check if some value is null:  t.val IS NULL)
