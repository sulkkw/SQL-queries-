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

  Task 2 INSERT SAMPLE SOLUTION

*/

/*
Task 2 (b):

Load the ANIMAL and BREEDING_EVENT tables with your own test data using the 
supplied T2-cb-insert.sql file script file, and SQL commands which will  
insert as a minimum, the following sample data -
 - 12 animals, some of which must have been captured from the wild, i.e. 
      are not the offspring from a breeding event, and
- 4 breeding events
Your inserted rows must meet the assignment specification requirements
*/

-- INSERTING into ANIMAL
INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    1,
    'M',
    NULL,
    'AUS10',
    'Setonix',
    'brachyurus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    2,
    'F',
    NULL,
    'AUS10',
    'Setonix',
    'brachyurus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    5,
    'M',
    NULL,
    'AUS10',
    'Setonix',
    'brachyurus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    6,
    'M',
    NULL,
    'AUS20',
    'Acinonyx',
    'jubatus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    8,
    'M',
    NULL,
    'AUS20',
    'Equus',
    'zebra'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    10,
    'M',
    NULL,
    'AUS30',
    'Diceros',
    'bicornis'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    11,
    'F',
    NULL,
    'AUS30',
    'Diceros',
    'bicornis'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    13,
    'M',
    NULL,
    'AUS30',
    'Acinonyx',
    'jubatus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    14,
    'F',
    NULL,
    'AUS30',
    'Acinonyx',
    'jubatus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    16,
    'M',
    NULL,
    'SAF10',
    'Panthera',
    'leo'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    17,
    'F',
    NULL,
    'SAF10',
    'Panthera',
    'leo'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    21,
    'M',
    NULL,
    'SAF20',
    'Myrmecobius',
    'fasciatus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    22,
    'M',
    NULL,
    'SAF20',
    'Sarcophilus',
    'harrisii'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    23,
    'M',
    NULL,
    'SAF20',
    'Macrotis',
    'lagotis'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    24,
    'F',
    NULL,
    'SAF20',
    'Lasiorhinus',
    'krefftii'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    25,
    'M',
    NULL,
    'SAF20',
    'Equus',
    'grevyi'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    26,
    'M',
    NULL,
    'SAF30',
    'Hippopotamus',
    'amphibius'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    27,
    'F',
    NULL,
    'SAF30',
    'Hippopotamus',
    'amphibius'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    28,
    'F',
    NULL,
    'SAF30',
    'Panthera',
    'leo'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    29,
    'F',
    NULL,
    'SAF30',
    'Equus',
    'grevyi'
);

-- INSERTING into BREEDING_EVENT
INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    1,
    TO_DATE('01-Jan-2020', 'dd-Mon-yyyy'),
    1,
    2
);

INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    2,
    TO_DATE('30-Jan-2020', 'dd-Mon-yyyy'),
    10,
    11
);

INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    3,
    TO_DATE('12-May-2020', 'dd-Mon-yyyy'),
    10,
    11
);

INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    4,
    TO_DATE('19-Jun-2020', 'dd-Mon-yyyy'),
    13,
    14
);

INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    5,
    TO_DATE('23-Jul-2020', 'dd-Mon-yyyy'),
    16,
    17
);

INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    6,
    TO_DATE('23-Aug-2020', 'dd-Mon-yyyy'),
    16,
    17
);

INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    7,
    TO_DATE('23-Sep-2020', 'dd-Mon-yyyy'),
    16,
    17
);

INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    8,
    TO_DATE('25-Nov-2020', 'dd-Mon-yyyy'),
    26,
    27
);

INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    9,
    TO_DATE('13-Jan-2021', 'dd-Mon-yyyy'),
    26,
    27
);

INSERT INTO breeding_event (
    brevent_id,
    brevent_date,
    father_id,
    mother_id
) VALUES (
    10,
    TO_DATE('31-Jan-2021', 'dd-Mon-yyyy'),
    25,
    29
);

-- INSERTING into ANIMAL, result of BREEDING_EVENT
INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    3,
    'F',
    1,
    'AUS10',
    'Setonix',
    'brachyurus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    12,
    'F',
    2,
    'AUS10',
    'Diceros',
    'bicornis'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    30,
    'F',
    8,
    'AUS20',
    'Hippopotamus',
    'amphibius'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    18,
    'F',
    7,
    'AUS20',
    'Panthera',
    'leo'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    15,
    'M',
    3,
    'AUS30',
    'Diceros',
    'bicornis'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    19,
    'F',
    4,
    'AUS30',
    'Acinonyx',
    'jubatus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    20,
    'M',
    4,
    'AUS30',
    'Acinonyx',
    'jubatus'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    31,
    'F',
    6,
    'SAF10',
    'Panthera',
    'leo'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    32,
    'F',
    9,
    'SAF10',
    'Hippopotamus',
    'amphibius'
);

INSERT INTO animal (
    animal_id,
    animal_sex,
    brevent_id,
    centre_id,
    spec_genus,
    spec_name
) VALUES (
    33,
    'F',
    10,
    'SAF30',
    'Equus',
    'grevyi'
);

COMMIT;
