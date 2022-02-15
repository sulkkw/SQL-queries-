/*
Databases Units
Author: FIT Database Teaching Team
License: Copyright © Monash University, unless otherwise stated. All Rights Reserved.
COPYRIGHT WARNING
Warning
This material is protected by copyright. For use within Monash University only. NOT FOR RESALE.
Do not remove this notice. 
*/

/*

  2021 Semester 1 Assignment 2A

  Task 3 ALTER SAMPLE SOLUTION

*/

/*
Task 3:

Make the listed changes to the "live" database
*/

-- (a)

ALTER TABLE centre ADD centre_animal_count NUMBER(3) DEFAULT 0 NOT NULL;

COMMENT ON COLUMN centre.centre_animal_count IS
    'Count of animals born at this centre';

-- (b)
/*
******* Explain here your selected approach and its advantage/s *********

Cannot delete due to FK rules, Some animals have been involved in a breeding
event, must add a column to ANIMAL to indicate no longer alive

***** Test will fail many cases due to the hard coded PK - this is fine ******
***** as marker may not have the chosen PK => NO PENALTY ************************

*/

ALTER TABLE animal ADD (
    animal_living CHAR(1) DEFAULT 'Y' NOT NULL,
    CONSTRAINT chk_animal_living CHECK ( animal_living IN ( 'Y', 'N' ) )
);

COMMENT ON COLUMN animal.animal_living IS
    'Flag for animal alive or not (Y or N)';

UPDATE animal
SET
    animal_living = 'N'
WHERE
    animal_id = 3;

COMMIT;

-- (c)
-- "You should note, in arriving at your solution, that it may be necessary to extend/modify
-- "these types at regular intervals" => thus ** MUST ** use a lookup table

-- drop table prior to create
drop table centre_type;

-- create table
CREATE TABLE centre_type (
    centre_type_code  CHAR(1) NOT NULL,
    centre_type_desc  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN centre_type.centre_type_code IS
    'Code for this type of centre';

COMMENT ON COLUMN centre_type.centre_type_desc IS
    'Description for this type code';

alter table centre_type add constraint centre_type_pk primary key (centre_type_code);

-- insert current types
INSERT INTO centre_type VALUES (
    'Z',
    'Zoo'
);

INSERT INTO centre_type VALUES (
    'W',
    'Wildlife Park'
);

INSERT INTO centre_type VALUES (
    'S',
    'Sanctuary'
);

INSERT INTO centre_type VALUES (
    'N',
    'Nature Reserve'
);

INSERT INTO centre_type VALUES (
    'O',
    'Other'
);

COMMIT;
-- Do not add CHECK clause to lookup table, this defeats the purpose of having an 
-- easily expanded set of lookup values (normal users do not enter to the
-- lookup table, done by database admin staff)

-- add FK to  centre
ALTER TABLE centre ADD centre_type_code CHAR(1) DEFAULT 'O' NOT NULL;

ALTER TABLE centre
    ADD CONSTRAINT centre_type_centre FOREIGN KEY ( centre_type_code )
        REFERENCES centre_type ( centre_type_code );
        
-- update FK values to match centre name, must update all four as you cannot
-- know what is in the database ("O" assigned by default)
UPDATE centre
SET
    centre_type_code = 'Z'
WHERE
    centre_name LIKE '%Zoo%';

UPDATE centre
SET
    centre_type_code = 'W'
WHERE
    centre_name LIKE '%Park%';

UPDATE centre
SET
    centre_type_code = 'S'
WHERE
    centre_name LIKE '%Sanctuary%';

UPDATE centre
SET
    centre_type_code = 'R'
WHERE
    centre_name LIKE '%Reserve%';

commit;
