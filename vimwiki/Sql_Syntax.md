# BETWEEN
* begin and end values are included (inclusive).
```sql
  # Show all details (yr, subject, winner) of the Literature prize winners
  # for 1980 to 1989 inclusive.
  execute(<<-SQL)
    SELECT yr, subject, winner 
    FROM nobels 
    WHERE yr BETWEEN 1980 AND 1989 AND (subject LIKE 'Literature')
  SQL

```

# GROUP BY
**NOTE:** 

```sql
SELECT DISTINCT continent , COUNT(name)
    FROM countries 
    WHERE population >= 10000000
    GROUP BY continent 
```
  
# ORDER BY
  * ASC | DESC - default is ASC 
```sql
    SELECT id, title, yr 
    FROM movies 
    WHERE title LIKE '%Star Trek%'
    ORDER BY yr
```

# JOIN 
 ** If you don't put INNER or OUTER keywords in front of the SQL JOIN keyword, then INNER JOIN is used. In short INNER JOIN = JOIN **
 
```sql
    SELECT name FROM actors 
    JOIN castings ON actors.id = castings.actor_id
    JOIN movies on castings.movie_id = movies.id
    WHERE movies.title = 'Alien'
```

# SELF JOIN
* having two selectors for one table
```sql
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City 
ORDER BY A.City;
```

  
# HAVING

```sql
 SELECT DISTINCT continent
    FROM countries
    GROUP BY continent
    HAVING SUM(population) > 100000000
```
  
# CASE
```sql
 
SELECT mdate, team1,
 SUM(CASE WHEN team1 = goal.teamid
            THEN 1
            ELSE 0
 END) score1,
 team2,
 	SUM(CASE WHEN team2 = goal.teamid  THEN 1  ELSE 0 END) 
score2
  FROM game
  LEFT JOIN goal ON goal.matchid = game.id
GROUP BY mdate,matchid, team1,team2
 
```

# AVERAGE
```sql
SELECT 
    department_name, ROUND(AVG(salary), 0) avg_salary
FROM
    employees
        INNER JOIN
    departments USING (department_id)
GROUP BY department_name
ORDER BY department_name;
```

# Aggregate functions
* You must use HAVING clause to query aggregate values


# SUM
```sql
  SELECT SUM(gdp) FROM countries
    WHERE continent = 'Africa'
```

# COUNT
```sql
 # How many countries have an area of more than 1,000,000?
  execute(<<-SQL)
  SELECT COUNT(name)
  FROM countries 
  WHERE area > 1000000-
  ```
  
# XOR
* Exclusive OR (XOR). Show either or but NOT BOTH.

# ROUND
 * ROUND(f,p) returns f rounded to p decimal places.

* The number of decimal places may be negative, this will round to the nearest 10 (when p is -1) or 100 (when p is -2) or 1000 (when p is -3) etc..


```sql
ROUND(7253.86, 0)    ->  7254
ROUND(7253.86, 1)    ->  7253.9
ROUND(7253.86,-3)    ->  7000
```
  
 # ALL 
 ```sql
 SELECT name
  FROM world
 WHERE population >= ALL(SELECT population
                           FROM world
                          WHERE population>0)
 ```
 
# NOT EQUAL TO
* You can simply use the ***<>*** to say that you do want those values equal
 
