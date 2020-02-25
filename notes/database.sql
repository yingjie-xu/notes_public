-- Try to write SQLs on your own, use this as a reference when you are not sure
-- how to run certain queries.


SELECT *
FROM skaters
;

SELECT sname, age
FROM skaters
;

-- contains duplicates
SELECT age
FROM skaters
;

-- distinct age records
SELECT DISTINCT age
FROM skaters
;

-- compare =, >, <, <>
SELECT *
FROM skaters
WHERE age > 12
;

SELECT *
FROM skaters
WHERE age <> 12
;

-- between is inclusive on both sides
SELECT *
FROM skaters
WHERE age BETWEEN 12 AND 15
;

-- Strings and dates

SELECT *
FROM competition
WHERE ctype = 'local'
;

SELECT *
FROM competition
WHERE ctype = 'local' OR ctype = 'regional'
;

-- date is represented by a string and could be compared with >,<,=
SELECT *
FROM competition
WHERE ctype = 'local' AND cdate > '2015-01-01' 
;

SELECT *
FROM skaters
WHERE sname > 'l'
;

-- String matching
SELECT *
FROM skaters
WHERE sname LIKE 'd%'
;

SELECT *
FROM skaters
WHERE sname LIKE '_e%'
;

-- Ordering by a, b

SELECT *
FROM skaters
ORDER BY rating
;

SELECT *
FROM skaters
WHERE age < 17
ORDER BY rating
;

SELECT *
FROM skaters
WHERE age < 17
ORDER BY age, rating
;

SELECT *
FROM skaters
WHERE age < 17
ORDER BY age DESC, rating
;

-- Aliases(AS)
SELECT sid, rating as oldrating, rating+1 as newrating
FROM skaters;

SELECT sid, rating, 'Skater' as job
FROM skaters;

SELECT sid, rating as oldrating, rating+1 as newrating
FROM skaters;

-- Limits ..
SELECT *
FROM skaters
LIMIT 2;

-- Aliases
SELECT sname, rating FROM skaters;

SELECT skaters.sname, skaters.rating FROM skaters;

-- Create alias by using `AS` or put the alias directly after
SELECT s.sname, s.rating FROM skaters AS s;

SELECT sname, rating FROM skaters WHERE age = 10;

SELECT sname, rating, 15 maxallowedrating FROM skaters;

-- Cross Product.
SELECT * FROM skaters, participates;

SELECT *
FROM skaters, participates
WHERE skaters.sid = participates.sid
;

SELECT *
FROM skaters, participates
WHERE skaters.sid = participates.sid
  AND participates.cid = 101
;

SELECT *
FROM skaters JOIN participates
ON skaters.sid = participates.sid
;

-- Range variable / aliases ...
SELECT *
FROM skaters s, participates p
WHERE s.sid = p.sid
;

SELECT p.sid
FROM participates p, competition c
WHERE p.cid = c.cid
  AND c.ctype = 'local'
;

SELECT p.sid
FROM participates p, competition c
WHERE p.cid = c.cid
  AND c.ctype = 'regional'
;

SELECT p.sid
FROM participates p, competition c
WHERE p.cid = c.cid
  AND c.ctype = 'local'

UNION

SELECT p.sid
FROM participates p, competition c
WHERE p.cid = c.cid
  AND c.ctype = 'regional'
;
-- Also UNION ALL ...
-- Scope of p and c aliases ?

SELECT p.sid
FROM participates p, competition c
WHERE p.cid = c.cid
  AND c.ctype = 'local'

INTERSECT

SELECT p.sid
FROM participates p, competition c
WHERE p.cid = c.cid
  AND c.ctype = 'regional'
;

-- join instead of union
SELECT p.sid
FROM participates p, competition c
WHERE p.cid = c.cid
  AND (c.ctype = 'regional' OR c.ctype = 'local') -- Same as UNION ALL
;


-- join instead of intersection. (might contain duplicates)
SELECT p1.sid
FROM participates p1, participates p2
   , competition c1, competition c2
WHERE p1.cid = c1.cid AND c1.ctype = 'local'
  AND p2.cid = c2.cid AND c2.ctype = 'regional'
  AND p1.sid = p2.sid
;


SELECT p.sid
FROM participates p, competition c
WHERE p.cid = c.cid
  AND c.ctype = 'local'

EXCEPT

SELECT p.sid
FROM participates p, competition c
WHERE p.cid = c.cid
  AND c.ctype = 'regional'
;


-- IN syntax
SELECT sid FROM participates WHERE cid = 101
;

SELECT sname FROM skaters WHERE sid IN ( 31, 58)
;


-- Subquery / Nested Query
SELECT sname
FROM skaters
WHERE sid IN (SELECT sid FROM participates WHERE cid = 101)
;

SELECT sname
FROM skaters -- Does not work number of columns do not match for in operator
WHERE sid IN (SELECT sid, sname FROM participates WHERE cid = 101)
;

SELECT sname
FROM skaters s, participates p
WHERE s.sid = p.sid AND p.cid = 101
;

SELECT sname
FROM skaters s, participates p
WHERE s.sid = p.sid AND p.cid = 103
;

SELECT sname
FROM skaters s, participates p
WHERE s.sid = p.sid AND p.cid IN (101, 103)
;


SELECT sname
FROM skaters
WHERE sid IN (SELECT sid FROM participates WHERE cid IN (101, 103))
;

SELECT sname
FROM skaters
WHERE sid IN (SELECT sid FROM participates WHERE cid IN 
			( SELECT cid FROM competition WHERE ctype='local'))
;

SELECT sname
FROM skaters
WHERE sid NOT IN (SELECT sid FROM participates WHERE cid = 101)
;


-- EXISTS, corelated subquery
SELECT s.sname
FROM skaters  s
WHERE EXISTS (
               SELECT *
               FROM participates p
               WHERE p.cid = 101 AND p.sid = s.sid
             )
;
-- IN instead of EXISTS ?


-- Top order skaters.
SELECT *
FROM skaters
WHERE rating >= ALL (SELECT rating FROM skaters)
;

-- smaller or equal to all of the result
SELECT *
FROM skaters
WHERE rating <= ALL (SELECT rating FROM skaters)
;

-- large than any one of the result
SELECT *
FROM skaters
WHERE rating > ANY (SELECT rating FROM skaters)
;

-- Aggregate Functions in SQL
SELECT count(*)
FROM skaters
;

SELECT rating
FROM skaters
;

SELECT count(rating)
FROM skaters
;

SELECT count(DISTINCT rating)
FROM skaters
;

SELECT age
FROM skaters
;


SELECT AVG(age)
FROM skaters
;

SELECT age
FROM skaters
WHERE rating = 9
;

SELECT AVG(age)
FROM skaters
WHERE rating = 9
;

SELECT AVG(age)
FROM 
( -- Here "t" is a derived table
 SELECT age
 FROM skaters
 WHERE rating = 9
) t
;

SELECT AVG(age), COUNT(*)
FROM skaters
WHERE rating = 9
;

SELECT SUM(rating)
FROM skaters
;

SELECT MAX(rating), MIN(rating)
FROM skaters
;

-- sub query is an aggregation but the outer query is not.
SELECT sname
FROM skaters
WHERE rating = (SELECT MAX(rating) FROM skaters)
;

-- ERROR !! aggregate functions are not allowed in WHERE
SELECT sname
FROM skaters
WHERE rating = MAX(rating)
;

-- Grouping ...

SELECT AVG(age)
FROM skaters
GROUP BY rating
;

SELECT rating, AVG(age), COUNT(*)
FROM skaters
GROUP BY rating
;

SELECT rating, AVG(age), MIN(age)
, MAX(age), COUNT(*), SUM(1)
FROM skaters
GROUP BY rating
;

-- ERROR !! column "skaters.sname" must appear in the GROUP BY clause or be used in an aggregate function
SELECT sname, rating, AVG(age)
FROM skaters
GROUP BY rating
;


SELECT rating, AVG(age) as avgage
FROM skaters
WHERE rating > 6
GROUP BY rating
ORDER BY avgage
;


SELECT rating, AVG(age)
FROM skaters
WHERE age > 10
GROUP BY rating
ORDER BY rating
;


-- Error !! no aggregation function in where
SELECT rating, AVG(age)
FROM skaters
GROUP BY rating
WHERE AVG(age) > 11
;

SELECT rating, AVG(age)
FROM skaters
GROUP BY rating
HAVING AVG(age) > 11
;


SELECT rating, AVG(age)
FROM skaters
WHERE rating < 10
GROUP BY rating
HAVING AVG(age) > 11
;

SELECT rating, age, count(*)
FROM skaters
GROUP BY rating, age
;

SELECT c.cid, p.sid
FROM competition c, participates p
WHERE c.cid = p.cid
;


SELECT c.cid, COUNT(*) AS numskaters
FROM competition c, participates p
WHERE c.cid = p.cid
GROUP BY c.cid
;

SELECT c.cid, COUNT(*) AS numskaters
FROM competition c, participates p
WHERE c.cid = p.cid
AND c.cid IN ( 101,104)
GROUP BY c.cid
;

SELECT cid, COUNT(*) AS numskaters
FROM
(
  SELECT c.cid, p.sid
  FROM competition c, participates p
  WHERE c.cid = p.cid
  AND c.cid IN ( 101,104)
) t2
GROUP BY cid
;

SELECT c.cid, COUNT(*) AS numskaters
FROM competition c, participates p
WHERE c.cid = p.cid
GROUP BY c.cid
HAVING COUNT(*) >= 2
;

SELECT AVG (S2.age)
FROM Skaters S2
GROUP BY rating
;


-- Error !! no nesting of AGG operators.
SELECT  MIN (AVG (S2.age))
FROM Skaters S2
GROUP BY rating
;



-- Use derived tables OR Views
SELECT MIN(avgage)
FROM
(
  SELECT  AVG (S2.age) AS avgage
  FROM Skaters S2
  GROUP BY rating
)X
;

SELECT DISTINCT s.sid, s.sname
FROM  skaters s, participates p
WHERE s.sid = p.sid
;

CREATE VIEW activeSkaters (sid,sname) AS
SELECT DISTINCT s.sid, s.sname
FROM  skaters s, participates p
WHERE s.sid = p.sid
;

SELECT *
FROM activeSkaters
;

DROP VIEW activeSkaters;

CREATE VIEW avgSkaterAges(rating, avgage) AS
SELECT  rating, AVG (S2.age)
FROM Skaters S2
GROUP BY rating
;

SELECT * FROM avgSkaterAges;

SELECT MIN(avgage) FROM avgSkaterAges;

DROP VIEW avgSkaterAges;

-- NULL ....  slides

INSERT INTO skaters VALUES(72, 'katie', NULL, 12);
INSERT INTO skaters VALUES(83, 'Jack', NULL, 11);

SELECT * FROM skaters;

SELECT sname, rating, rating+1 newrating  
FROM skaters;

SELECT * FROM skaters WHERE rating > 5;

SELECT * FROM skaters WHERE NOT rating > 5;

-- Error !!
SELECT * FROM skaters WHERE rating = NULL;

SELECT * FROM skaters WHERE rating IS NULL;

SELECT * FROM skaters WHERE rating IS NOT NULL;


SELECT sname, rating
, COALESCE(rating, 0) modrating, 
COALESCE(rating, 0)+1 newrating
FROM skaters;


SELECT sname, rating
  ,CASE WHEN rating IS NULL THEN 0 ELSE rating END modrating
FROM skaters;

SELECT sname, rating
  ,CASE WHEN rating = 10 THEN rating
	      WHEN rating IS NULL THEN 1
				ELSE rating + 1
	 END modrating
FROM skaters;

-- 3 Valued Logic (slides)

SELECT rating FROM skaters;

-- NULLs are considered same for distnct
SELECT distinct rating FROM skaters;

SELECT rating, count(*)
FROM skaters
GROUP BY rating
;


SELECT count(*) rating FROM skaters;

SELECT count(rating) rating FROM skaters;

--SELECT count(distinct rating) rating FROM skaters;

SELECT AVG(rating) FROM skaters;

SELECT AVG(rating),
 AVG(age)
 ,SUM(rating), SUM(age), COUNT(*)
  FROM skaters;


----- INNER JOINS

SELECT s.sid, s.sname, p.cid, p.rank
FROM skaters s, participates p
WHERE s.sid = p.sid
ORDER BY s.sid, p.cid
;

SELECT *
FROM skaters s INNER JOIN participates p
  ON s.sid = p.sid
ORDER BY s.sid, p.cid
;

SELECT *
FROM skaters s INNER JOIN participates p
  ON s.sid = p.sid
  AND p.cid IN ( 101, 103 )
ORDER BY s.sid, p.cid
;

SELECT *
FROM skaters s INNER JOIN participates p
  ON s.sid = p.sid
WHERE p.cid IN ( 101, 103 )
ORDER BY s.sid, p.cid
;

SELECT *
FROM skaters s LEFT JOIN participates p
  ON s.sid = p.sid
ORDER BY s.sid, p.cid
;

SELECT *
FROM participates p RIGHT JOIN  skaters s
  ON s.sid = p.sid
ORDER BY s.sid, p.cid
;

SELECT * FROM skaters ORDER BY sid;

SELECT * FROM ourskaters ORDER BY sid;

SELECT s.sid, s.sname, s.rating, s.age, o.sid
     , o.sname, o.rating, o.age
FROM skaters s FULL JOIN ourskaters o
  ON s.sid = o.sid
ORDER BY s.sid, o.sid
;

SELECT s.sid, s.sname, s.rating, s.age, o.sid
     , o.sname, o.rating, o.age
FROM skaters s INNER JOIN ourskaters o
  ON s.sid = o.sid
ORDER BY s.sid, o.sid
;

