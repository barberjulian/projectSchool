--@V:\lab1_init.sql
--@v:\utlxplan.sql
--SET PAGESIZE 200
--SET LINESIZE 200
--SET WRAP OFF

--CONN sys/oracle@db2233.WORLD
--CONN DBM449_USER/DEVRY@db2233.WORLD
--CONN GEORGE/ORACLE@db2233.WORLD

SELECT sup_code AS 
	"supplier code", prod_code, sum(sale_units*sale_price)
	AS "total sales"
	FROM supplier NATURAL JOIN sales
	NATURAL JOIN product
	GROUP BY ROLLUP(sup_code, prod_code)
	ORDER BY sup_code;
	
SELECT time_month AS 
	"Month Code", prod_code, sum(sale_units*sale_price)
	AS "Total Sales"
	FROM time NATURAL JOIN sales
	NATURAL JOIN PRODUCT
	GROUP BY CUBE(time_month, prod_code)
	ORDER BY time_month, prod_code;
	
	
CREATE MATERIALIZED VIEW LOG 
ON time 
WITH ROWID, SEQUENCE INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW salesbymonth
BUILD IMMEDIATE
REFRESH COMPLETE
ENABLE QUERY REWRITE
AS
SELECT time_year, time_month, 
prod_code, sum(sale_units), sum(sale_units*sale_price)
FROM time t, sales s
WHERE s.time_id = t.time_id
GROUP BY time_year, time_month, prod_code;

SELECT * FROM SALESBYMONTH;
INSERT INTO salesbymonth VALUES(207, 110016, 'SM-18277',1,8.95);
exec DBMS_MVIEW.REFRESH('SALESBYMONTH', 'C');
