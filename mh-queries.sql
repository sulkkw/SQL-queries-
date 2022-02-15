--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-queries.sql

--Student ID: 31842305
--Student Name:Ko Ko Win
--Tutorial No: 05 

/* Comments for your marker:




*/


/*
    Q1
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer 
SELECT 
    ht_nbr, 
    e.emp_nbr, 
    emp_lname,
    emp_fname, 
    to_char(ed.end_last_annual_review, 'DY DD MON YYYY') as review_date 
FROM 
    MH.endorsement ed 
    JOIN MH.employee e ON ed.emp_nbr = e.emp_nbr 

WHERE 
     end_last_annual_review > '31/03/2020'

ORDER BY
    end_last_annual_review  ASC;   

/*
    Q2
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer 
SELECT 
    charter_nbr, 
    charter_special_reqs, 
    cl.client_nbr, 
    client_lname, 
    client_fname 

FROM 
    MH.charter ch 
    JOIN MH.client cl ON ch.client_nbr = cl.client_nbr  

WHERE 
    charter_special_reqs IS NOT NULL

ORDER BY 
    charter_nbr ASC; 
    

/*
    Q3
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT 
    ch.charter_nbr, 
    charter_cost_per_hour, 
    client_fname || ' ' || client_lname as FULLNAME
    
FROM 
    MH.charter ch 
    JOIN MH.client cl ON ch.client_nbr = cl.client_nbr 
    JOIN MH.charter_leg chl ON chl.charter_nbr = ch.charter_nbr
    JOIN MH.location l ON chl.location_nbr_destination = l.location_nbr
    
    
WHERE 
    (charter_cost_per_hour < 1000 OR charter_special_reqs is null) 
    AND location_name = 'Mount Doom' 
    
    
ORDER BY 
    FULLNAME DESC; 


    


/*
    Q4
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT 
    htp.ht_nbr, 
    ht_name, 
    COUNT(htp.ht_nbr) as number_of_helicopters
    
    

FROM 
    MH.helicopter_type htp
    JOIN MH.helicopter h ON htp.ht_nbr = h.ht_nbr 

GROUP BY 
    htp.ht_nbr, 
    ht_name 

HAVING COUNT(htp.ht_nbr) >= 2 

ORDER BY 
    number_of_helicopters DESC; 


/*
    Q5
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer 
SELECT 
    location_nbr, 
    location_name, 
    COUNT(location_nbr_origin) AS location_used 

FROM 
    MH.location l 
    JOIN MH.charter_leg cl ON l.location_nbr = cl.location_nbr_origin

GROUP BY 
    location_nbr, 
    location_name 

HAVING COUNT(location_nbr_origin) > 1

ORDER BY 
    location_used ASC; 


/*
    Q6
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT 
    htp.ht_nbr, 
    ht_name, 
    NVL(SUM(heli_hrs_flown),0) AS total_hours_flown

FROM 
    MH.helicopter_type htp
    LEFT JOIN MH.helicopter h ON htp.ht_nbr = h.ht_nbr 

GROUP BY 
    htp.ht_nbr, 
    ht_name 

ORDER BY 
    total_hours_flown ASC;





/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT 
    c.charter_nbr, 
    to_char(cl_etd,'dd-Mon-yyyy hh24:mi') AS cl_etd
    

FROM 
    MH.charter c 
    JOIN MH.charter_leg cl ON c.charter_nbr = cl.charter_nbr 
    JOIN MH.employee e ON c.emp_nbr = e.emp_nbr 

WHERE 
    cl_leg_nbr = 1 
    AND emp_fname = 'Frodo' 
    AND emp_lname = 'Baggins' 
    AND cl.cl_ata IS NOT NULL
   

ORDER BY cl.cl_etd DESC; 


    
/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT 
    charter_nbr, 
    cl.client_nbr, 
    NVL(client_lname, '-') AS client_lastname, 
    NVL(client_fname, '-') AS client_firstname,
    lpad(to_char(charter_cost_per_hour * charter_num_hours,'$990.99'), 17, ' ') as totalchartercost 

FROM 
    MH.client cl RIGHT JOIN MH.charter ch ON 
    cl.client_nbr = ch.client_nbr 
    NATURAL JOIN 
    
    (SELECT 
        c.charter_nbr, 
        SUM(cl_ata - cl_atd)*24 AS charter_num_hours 
    FROM 
        MH.charter_leg chl LEFT JOIN MH.charter c 
        ON chl.charter_nbr = c.charter_nbr 
    
    WHERE 
        cl_ata IS NOT NULL 
    
    GROUP BY 
        c.charter_nbr) 

WHERE 
     charter_cost_per_hour * charter_num_hours < 
     (SELECT 
        AVG(charter_cost_per_hour * charter_num_hours) as avg_num 
      FROM mh.charter c NATURAL JOIN 
        (SELECT 
        c.charter_nbr, 
        SUM(cl_ata - cl_atd)*24 AS charter_num_hours 
    FROM 
        MH.charter_leg chl LEFT JOIN MH.charter c 
        ON chl.charter_nbr = c.charter_nbr 
    
    WHERE 
        cl_ata IS NOT NULL 
    
    GROUP BY 
        c.charter_nbr)) 

ORDER BY 
    totalchartercost DESC; 
    
            
/*
    Q9
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT 
    charter_nbr, 
    emp_fname || ' ' || emp_lname as PILOTNAME, 
    client_fname || ' ' || client_lname as CLIENTNAME 

FROM 
    MH.charter_leg chl
    NATURAL JOIN MH.employee emp 
    NATURAL JOIN MH.client c 

WHERE 
     charter_nbr IN( 
        select charter_nbr from MH.charter_leg where (cl_ata - cl_atd) = 0
        AND 

     
        

ORDER BY 
    charter_nbr ;
    
    


     
     















