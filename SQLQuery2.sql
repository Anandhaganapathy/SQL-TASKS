/*To implement the concepts of Pivot and unpivot the values in SQL Table.*/
use Studentidcard;
Create Table onlinecourse 
( 
CourseName nvarchar(50), 
CourseCategory nvarchar(50),
Price int  
) 

Insert into onlinecourse  values('C', 'PROGRAMMING', 5000) 
Insert into onlinecourse  values('JAVA', 'PROGRAMMING', 6000) 
Insert into onlinecourse  values('PYTHON', 'PROGRAMMING', 8000) 
Insert into onlinecourse  values('PLACEMENT 100', 'INTERVIEWPREPARATION', 5000) 

SELECT * FROM onlinecourse;

SELECT CourseName, PROGRAMMING, INTERVIEWPREPARATION
FROM onlinecourse
PIVOT 
( 
SUM(Price) FOR CourseCategory IN (PROGRAMMING, INTERVIEWPREPARATION ) 
) AS PivotTable 

SELECT CourseName, CourseCategory, Price 
FROM 
(
SELECT CourseName, PROGRAMMING, INTERVIEWPREPARATION FROM onlinecourse
PIVOT 
( 
SUM(Price) FOR CourseCategory IN (PROGRAMMING, INTERVIEWPREPARATION) 
) AS PivotTable
) P 
UNPIVOT 
( 
Price FOR CourseCategory IN (PROGRAMMING, INTERVIEWPREPARATION)
) 
AS UnpivotTable


/*To implement the merge concepts in SQL Table.*/

Create Table Pricelist
( 
itemno int , 
itemname varchar(20),
Price int 
) 

Insert into Pricelist  values(1, 'Tea', 10) 
Insert into Pricelist  values(2, 'coffee', 20) 
Insert into Pricelist  values(3, 'Samosa', 5) 
Insert into Pricelist  values(4, 'Mushroom puffs', 25) 

SELECT * FROM Pricelist;

Create Table updatePricelist
( 
itemno int , 
itemname varchar(20),
Price int 
) 

Insert into updatePricelist  values(1, 'Tea', 15) 
Insert into updatePricelist  values(2, 'coffee', 20) 
Insert into updatePricelist  values(3, 'Samosa', 5) 
Insert into updatePricelist  values(5, 'Egg puffs', 30) 

SELECT * FROM updatePricelist;

MERGE Pricelist AS TARGET
    USING updatePricelist  AS SOURCE 
 
    ON (TARGET.itemno = SOURCE.itemno)
    WHEN MATCHED 
         AND TARGET.itemname <> SOURCE.itemname
         OR TARGET.Price <> SOURCE.Price
    
	THEN UPDATE
         SET TARGET.itemname = SOURCE.itemname,
         TARGET.Price = SOURCE.Price
    
	WHEN NOT MATCHED BY TARGET 
    
	THEN INSERT (itemno, itemname, Price)          
         VALUES (SOURCE.itemno, SOURCE.itemname, SOURCE.Price)
    WHEN NOT MATCHED BY SOURCE 
    THEN DELETE;
 
