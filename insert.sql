

#This is just test file
INSERT INTO dim_product_type VALUES(1,'FMCG');
INSERT INTO dim_product_type VALUES(2,'ELECTRONICS');
INSERT INTO dim_product_type VALUES(3,'DIGITAL');
INSERT INTO dim_product_type VALUES(4,'GROSARIES');
/
INSERT INTO dim_product VALUES(1,'Gillet Shaving Cream',1);
INSERT INTO dim_product VALUES(2,'Soap',1);
INSERT INTO dim_product VALUES(3,'Gell',1);
INSERT INTO dim_product VALUES(4,'DELL LAPTOP',2);
INSERT INTO dim_product VALUES(5,'Sony Bravia',2);
INSERT INTO dim_product VALUES(6,'Pen Drive',2);
INSERT INTO dim_product VALUES(7,'Iphone 6s',3);
INSERT INTO dim_product VALUES(8,'Samsung Galaxy',3);
INSERT INTO dim_product VALUES(9,'Ground Nuts',4);
INSERT INTO dim_product VALUES(10,'Suger',4);
INSERT INTO dim_product VALUES(11,'Soda',4);
INSERT INTO dim_product VALUES(12,'Minaral Water',4);


INSERT INTO dim_city VALUES(1,'PUNE',1)

DROP SEQUENCE seq_TIME
/
CREATE sequence seq_TIME START WITH 365 INCREMENT  BY -1    MAXVALUE 10000
/
truncate table dim_time
BEGIN
FOR I IN 1..365
  LOOP
      INSERT INTO dim_time VALUES(seq_time.NEXTVAL,SYSDATE-seq_time.currval ,TO_CHAR(SYSDATE-seq_time.currval  ,'WW'),TO_CHAR(SYSDATE-seq_time.currval ,'MM'),TO_CHAR(SYSDATE-seq_time.currval ,'YYYY'),TO_CHAR(SYSDATE-seq_time.currval ,'D'));
  END LOOP;
END;
/

SELECT to_char(sysdate,'D') from dual


SELECT * FROM DIM
SELECT TO_CHAR(SYSDATE,'MM') from dual

SELECT SYSDATE - 365 from dual


SELECT * FROM dim_time ORDER BY 1

DESC dim_week
DESC dim_weekday
DESC dim_year

--WeekDay
SELECT * FROM dim_weekday
DESC dim_weekday
TRUNCATE TABLE dim_weekday
DESC dim_time
INSERT INTO dim_weekday
SELECT DISTINCT weekday_id,
 CASE weekday_id
   WHEN 1 THEN  'Monday'
   WHEN 2 THEN  'TUESDAY'
    WHEN 3 THEN   'WEDNESDAY'
    WHEN 4 THEN   'THURSDAY'  
    WHEN 5 THEN   'FRIDAY'  
    WHEN 6 THEN   'SATURDAY'
    WHEN 7 THEN    'SUNDAY'  
  END A
FROM dim_time
d

--year
SELECT * FROM dim_year
INSERT INTO dim_year
SELECT DISTINCT year_id, year_id FROM dim_time

--Week
SELECT * FROM dim_week
DESC dim_week
TRUNCATE TABLE dim_week
DESC dim_time
INSERT INTO dim_week
SELECT DISTINCT week_id,week_id FROM dim_time

SELECT * FROM dim_weekday
INSERT INTO dim_weekday
SELECT DISTINCT weekday_id from dim_time
desc dim_time

SELECT * FROM dim_time