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

  Task 2 DML SAMPLE SOLUTION

*/

/*
Task 2 (c):

Complete the listed DML actions
*/

-- (i)
-- drop sequence commands not required
drop sequence animal_seq;
drop sequence breedevent_seq;

--  increment by 1 not required, it is the default, should not place upper limit
create sequence animal_seq start with 500 increment by 1;

create sequence breedevent_seq start with 500 increment by 1;

-- (ii)

UPDATE animal
SET
    centre_id = (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Kruger National Park'
    )
WHERE
    centre_id = (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'SanWild Wildlife Sanctuary'
    );

DELETE FROM centre
WHERE
    centre_name = 'SanWild Wildlife Sanctuary';

COMMIT;

-- (iii)
-- two separate commits required the inserts are not logically related
INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'F',
    NULL,
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Australia Zoo'
    ),
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);

COMMIT;

INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'M',
    NULL,
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Werribee Open Range Zoo'
    ),
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);
commit;

-- (iv)

-- insert the breeding event
INSERT INTO breeding_event VALUES (
    breedevent_seq.NEXTVAL,
    TO_DATE('10 Feb 2021', 'dd Mon yyyy'),
/* Mother id*/
    (
        SELECT
            animal_id
        FROM
            animal
        WHERE
                centre_id = (
                    SELECT
                        centre_id
                    FROM
                        centre
                    WHERE
                        centre_name = 'Australia Zoo'
                )
            AND spec_genus = (
                SELECT
                    spec_genus
                FROM
                    species
                WHERE
                    spec_popular_name = 'Tasmanian Devil'
            )
            AND spec_name = (
                SELECT
                    spec_name
                FROM
                    species
                WHERE
                    spec_popular_name = 'Tasmanian Devil'
            )
    ),
/* Father id*/
    (
        SELECT
            animal_id
        FROM
            animal
        WHERE
                centre_id = (
                    SELECT
                        centre_id
                    FROM
                        centre
                    WHERE
                        centre_name = 'Werribee Open Range Zoo'
                )
            AND spec_genus = (
                SELECT
                    spec_genus
                FROM
                    species
                WHERE
                    spec_popular_name = 'Tasmanian Devil'
            )
            AND spec_name = (
                SELECT
                    spec_name
                FROM
                    species
                WHERE
                    spec_popular_name = 'Tasmanian Devil'
            )
    )
);

commit;

-- insert the offspring
-- Allow treat as one transaction (adding the offspring or separate), although not
-- really logically related

INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'F', 
/* brevent_id, use father - simplest approach*/
    (
        SELECT
            brevent_id
        FROM
            breeding_event
        WHERE
            father_id = (
                SELECT
                    animal_id
                FROM
                    animal
                WHERE
                        centre_id = (
                            SELECT
                                centre_id
                            FROM
                                centre
                            WHERE
                                centre_name = 'Werribee Open Range Zoo'
                        )
                    AND spec_genus = (
                        SELECT
                            spec_genus
                        FROM
                            species
                        WHERE
                            spec_popular_name = 'Tasmanian Devil'
                    )
                    AND spec_name = (
                        SELECT
                            spec_name
                        FROM
                            species
                        WHERE
                            spec_popular_name = 'Tasmanian Devil'
                    )
            )
    ),
/* centre_id */
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Australia Zoo'
    ),
/* species details*/
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);

commit;

INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'M', 
/* brevent_id, use father - simplest approach*/
    (
        SELECT
            brevent_id
        FROM
            breeding_event
        WHERE
            father_id = (
                SELECT
                    animal_id
                FROM
                    animal
                WHERE
                        centre_id = (
                            SELECT
                                centre_id
                            FROM
                                centre
                            WHERE
                                centre_name = 'Werribee Open Range Zoo'
                        )
                    AND spec_genus = (
                        SELECT
                            spec_genus
                        FROM
                            species
                        WHERE
                            spec_popular_name = 'Tasmanian Devil'
                    )
                    AND spec_name = (
                        SELECT
                            spec_name
                        FROM
                            species
                        WHERE
                            spec_popular_name = 'Tasmanian Devil'
                    )
            )
    ),
/* centre_id */
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Australia Zoo'
    ),
/* species details*/
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);

commit;

/* Alternative using Mother to find breeding event

INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'F', 
-- brevent_id, use mother brevent_id is null not necessary for the first one
    (
        SELECT
            brevent_id
        FROM
            breeding_event
        WHERE
            mother_id = (
                SELECT
                    animal_id
                FROM
                    animal
                WHERE
                        centre_id = (
                            SELECT
                                centre_id
                            FROM
                                centre
                            WHERE
                                centre_name = 'Australia Zoo'
                        )
                    AND spec_genus = (
                        SELECT
                            spec_genus
                        FROM
                            species
                        WHERE
                            spec_popular_name = 'Tasmanian Devil'
                    )
                    AND spec_name = (
                        SELECT
                            spec_name
                        FROM
                            species
                        WHERE
                            spec_popular_name = 'Tasmanian Devil'
                    )
                    AND brevent_id IS NULL
            )
    ),
-- centre_id 
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Australia Zoo'
    ),
-- species details
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);
commit;

INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'M', 
-- brevent_id, use mother
    (
        SELECT
            brevent_id
        FROM
            breeding_event
        WHERE
            mother_id = (
                SELECT
                    animal_id
                FROM
                    animal
                WHERE
                        centre_id = (
                            SELECT
                                centre_id
                            FROM
                                centre
                            WHERE
                                centre_name = 'Australia Zoo'
                        )
                    AND spec_genus = (
                        SELECT
                            spec_genus
                        FROM
                            species
                        WHERE
                            spec_popular_name = 'Tasmanian Devil'
                    )
                    AND spec_name = (
                        SELECT
                            spec_name
                        FROM
                            species
                        WHERE
                            spec_popular_name = 'Tasmanian Devil'
                    )
                    AND brevent_id IS NULL
            )
    ),
-- centre_id 
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Australia Zoo'
    ),
-- species details
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);
commit;

*/
