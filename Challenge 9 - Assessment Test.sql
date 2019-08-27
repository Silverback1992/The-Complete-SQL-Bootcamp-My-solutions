--Assessment Test 2

--How can you retrieve all the information from the cd.facilites table?
SELECT * FROM cd.facilities;

/*
You want to print out a list of all the facilities and their cost to members.
How would you retrieve a list of only facility names and costs?
*/
SELECT name, membercost
FROM cd.facilities;

--How can you produce a list of facilities that charge a fee to members?
SELECT name
FROM cd.facilities
WHERE membercost != 0;

/*
How can you produce a list of facilities that charge a fee to members,
and that fee is less than 1/50th of the monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question.
*/
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE monthlymaintenance / 50 > membercost AND membercost != 0;

--How can you produce a list of all facilities with the word 'Tennis' in their name?
SELECT name
FROM cd.facilities
WHERE name LIKE '%Tennis%';

/*
How can you retrive the details of facilities with ID 1 and 5?
Try to do it without using the OR operator.
*/
SELECT *
FROM cd.facilities
WHERE facid IN (1,5);

/*
How can you produce a list of members who joined after the start of
September 2012? Return the memid, surname, firstname, and joindate
of the members in question.
*/
--Checking Tables
SELECT * FROM cd.members
LIMIT 5;

--Solution
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

/*
How can you produce an ordered list of the first 10 surnames in the members table?
This list must not contain duplicates.
*/
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname
LIMIT 10;

--You'd like to get the singup date of your last member. How can you retrieve this information?
SELECT MAX(joindate)
FROM cd.members;

--Different solution for this:
SELECT joindate
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

--Produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10;

/*
Produce a list of the total number of slots booked per facility in the month of September 2012.
Produce an output table consisting of facility id and slots, sorted by the number of slots.
*/
--Checking Tables
SELECT * FROM cd.bookings
LIMIT 5;

--Solution
SELECT cd.bookings.facid, name, SUM(slots) AS total_slots
FROM cd.bookings
INNER JOIN cd.facilities
ON cd.bookings.facid = cd.facilities.facid
WHERE extract(year from starttime) = 2012 AND extract(month from starttime) = 9
GROUP BY cd.bookings.facid, name
ORDER BY SUM(slots);

/*
Produce a list of facilities with more than 1000 slots booked.
Produce an output table consisting of facility id and total slots, sorted by facility id.
*/
SELECT cd.bookings.facid, name, SUM(slots) AS total_slots
FROM cd.bookings
INNER JOIN cd.facilities
ON cd.bookings.facid = cd.facilities.facid
GROUP BY cd.bookings.facid, name
HAVING SUM(slots) > 1000
ORDER BY cd.bookings.facid;

/*
How can you produce a list of the start times for bookings for tennis courts,
for the date '2012-09-21'?
Return a list of start time and facility name pairings, ordered by the time.
*/
SELECT cd.bookings.facid, name, starttime
FROM cd.bookings
INNER JOIN cd.facilities
ON cd.bookings.facid = cd.facilities.facid
WHERE extract(year from starttime) = 2012 AND 
extract(month from starttime) = 9 AND 
extract(day from starttime) = 21
AND cd.bookings.facid IN(0,1)
ORDER BY starttime;

--How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT starttime
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE firstname = 'David' AND surname = 'Farrell';