-- SQL Assignment 1.sql

/* Question 1
Which destination in the flights database is the furthest distance away, 
based on information in the flights table.  Show the SQL query(s) that support your conclusion. */

SELECT distinct dest as 'Destination', distance
FROM flights
ORDER BY distance desc
LIMIT 1;

/* Based on the flights table HNL is the furthest distance away at a distance of 4983. */


/* Question 2 
What are the different numbers of engines in the planes table?  For each number or engines,
which aircraft have the most number of seats?  Show the SQL statement(s) that support your result.
*/
#The different numbers of engines in the planes table are:
SELECT distinct engines as 'Number of Engines'
FROM planes;
/*The different number of engines are 1, 2, 3 and 4*/

#The aircraft with the most number of seats for each number of engines
SELECT tailnum as 'Aircraft', max(seats) as 'Number of Seats', engines as 'Number of Engines'
FROM planes
GROUP BY engines;

/* The aircraft with the most number of seats by engine is as follows:
    For 1 engine aircrafts : N201AA
    For 2 engine aircrafts:  N10156
    For 3 engine aircrafts: N854NW
    For 4 engine aircrafts: N281AT
    
*/

/* Question 3
Show the total number of flights
*/

SELECT count(*)
FROM flights;

/* The are 336,776 flights in the database (the number of records in the database)*/

/*Question 4
Show the total number of flights by airline(carrier)
*/

SELECT carrier, count(*) as 'Total Flights'
FROM flights
GROUP BY carrier;

/* Question 5
Show all of the airlines, ordered by number of flights in descending order
*/

SELECT carrier, count(*) as 'Number of Flights' 
FROM flights
GROUP BY carrier
ORDER BY `Number of Flights` desc;



/* Question 6
Show only the top 5 airlines, by number of flights, ordered by number of flights
in descending order
*/


SELECT carrier, count(*) as 'Number of Flights' 
FROM flights
GROUP BY carrier
ORDER BY `Number of Flights` desc
LIMIT 5;


/* Question 7
Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, 
ordered by number of flights in descending order
*/

SELECT carrier, count(*) as 'Number of Flights' 
FROM flights
WHERE distance >=1000
GROUP BY carrier
ORDER BY `Number of Flights` desc
LIMIT 5;

/* Question 8
Create a question that (a) uses data from the flights database and (b) requires aggregation to answer
it, and write down both the question, and the query that answers the question.
*/

-- Question: What are the 5 airlines with the most late arrivals?
SELECT carrier, count(*) as 'Number of Times Late Arrival'
FROM flights
WHERE arr_delay > 0 
GROUP BY carrier
ORDER BY `Number of Times Late Arrival` desc
LIMIT 5;