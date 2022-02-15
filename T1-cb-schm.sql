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

  Task 1 CREATE DDL SAMPLE SOLUTION
  
*/

/*
Using the model and details supplied, and the supplied T1-cb-schm.sql 
file, create an SQL schema file which can be used to create this database in 
Oracle. 
*/

-- Center Breeding SCHEMA
-- DROP TABLES 
DROP TABLE animal CASCADE CONSTRAINTS;

DROP TABLE breeding_event CASCADE CONSTRAINTS;

DROP TABLE centre CASCADE CONSTRAINTS;

DROP TABLE species CASCADE CONSTRAINTS;

-- CREATE TABLES
CREATE TABLE animal (
    animal_id   NUMBER(6) NOT NULL,
    animal_sex  CHAR(1) NOT NULL,
    brevent_id  NUMBER(6),
    centre_id   CHAR(6) NOT NULL,
    spec_genus  VARCHAR2(20) NOT NULL,
    spec_name   VARCHAR2(20) NOT NULL
);

ALTER TABLE animal
    ADD CONSTRAINT animal_sex_check CHECK ( animal_sex IN ( 'F', 'M' ) );

COMMENT ON COLUMN animal.animal_id IS
    'Unique ID for this animal ';

COMMENT ON COLUMN animal.animal_sex IS
    'Sex of animal (M or F)';

COMMENT ON COLUMN animal.brevent_id IS
    'Unique identifier for breeding event';

COMMENT ON COLUMN animal.centre_id IS
    'Unique identifier for Centre';

COMMENT ON COLUMN animal.spec_genus IS
    'Species genus';

COMMENT ON COLUMN animal.spec_name IS
    'Species Name';

ALTER TABLE animal ADD CONSTRAINT animal_pk PRIMARY KEY ( animal_id );

CREATE TABLE breeding_event (
    brevent_id    NUMBER(6) NOT NULL,
    brevent_date  DATE NOT NULL,
    mother_id     NUMBER(6) NOT NULL,
    father_id     NUMBER(6) NOT NULL
);

COMMENT ON COLUMN breeding_event.brevent_id IS
    'Unique identifier for breeding event';

COMMENT ON COLUMN breeding_event.brevent_date IS
    'Date breeding event took place';

COMMENT ON COLUMN breeding_event.mother_id IS
    'Unique ID for this animal ';

COMMENT ON COLUMN breeding_event.father_id IS
    'Unique ID for this animal ';

ALTER TABLE breeding_event ADD CONSTRAINT breeding_event_pk PRIMARY KEY ( brevent_id );

CREATE TABLE centre (
    centre_id        CHAR(6) NOT NULL,
    centre_name      VARCHAR2(40) NOT NULL,
    centre_address   VARCHAR2(100) NOT NULL,
    centre_director  VARCHAR2(30) NOT NULL,
    centre_phone_no  VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN centre.centre_id IS
    'Unique identifier for Centre';

COMMENT ON COLUMN centre.centre_name IS
    'Name of Centre';

COMMENT ON COLUMN centre.centre_address IS
    'Centre address';

COMMENT ON COLUMN centre.centre_director IS
    'Name of director of centre';

COMMENT ON COLUMN centre.centre_phone_no IS
    'Centre phone contact number';

ALTER TABLE centre ADD CONSTRAINT centre_pk PRIMARY KEY ( centre_id );

ALTER TABLE centre ADD CONSTRAINT centre_name_unq UNIQUE ( centre_name );

CREATE TABLE species (
    spec_genus          VARCHAR2(20) NOT NULL,
    spec_name           VARCHAR2(20) NOT NULL,
    spec_popular_name   VARCHAR2(40) NOT NULL,
    spec_family         VARCHAR2(20) NOT NULL,
    spec_natural_range  VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN species.spec_genus IS
    'Species genus';

COMMENT ON COLUMN species.spec_name IS
    'Species Name';

COMMENT ON COLUMN species.spec_popular_name IS
    'Species popular name';

COMMENT ON COLUMN species.spec_family IS
    'Species family';

COMMENT ON COLUMN species.spec_natural_range IS
    'Description of natural range of species';

ALTER TABLE species ADD CONSTRAINT species_pk PRIMARY KEY ( spec_genus,
                                                            spec_name );

ALTER TABLE species ADD CONSTRAINT spec_pop_name_unq UNIQUE ( spec_popular_name );

ALTER TABLE breeding_event
    ADD CONSTRAINT animalfather_be FOREIGN KEY ( father_id )
        REFERENCES animal ( animal_id );

ALTER TABLE breeding_event
    ADD CONSTRAINT animalmother_be FOREIGN KEY ( mother_id )
        REFERENCES animal ( animal_id );

ALTER TABLE animal
    ADD CONSTRAINT be_animal FOREIGN KEY ( brevent_id )
        REFERENCES breeding_event ( brevent_id );

ALTER TABLE animal
    ADD CONSTRAINT centre_animal FOREIGN KEY ( centre_id )
        REFERENCES centre ( centre_id );

ALTER TABLE animal
    ADD CONSTRAINT species_animal FOREIGN KEY ( spec_genus,
                                                   spec_name )
        REFERENCES species ( spec_genus,
                             spec_name );
