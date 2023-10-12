use Studentidcard;
CREATE TABLE CURDSP(ID INT IDENTITY(1,1) PRIMARY KEY, Name VARCHAR(100), Age INT, Address VARCHAR(100));
SELECT * FROM CURDSP;
exec usp_Employee_Management 0,'',0,'','SELECT'
exec usp_Employee_Management 0,'Anand',22,'Tiruppur','INSERT'
exec usp_Employee_Management 2,'prakash',22,'salem','UPDATE'
exec usp_Employee_Management 2,'prakash',22,'salem','DELETE'

CREATE PROC usp_Employee_Management

(@ID INT, @Name VARCHAR(100), @Age INT, @Address VARCHAR(100), @Type VARCHAR(100))
AS
BEGIN


IF @Type = 'SELECT'
BEGIN
SELECT * FROM CURDSP;
END;


IF @Type = 'INSERT'
BEGIN
INSERT INTO CURDSP(Name,Age,Address) VALUES(@Name,@Age,@Address);
END;


IF @Type = 'UPDATE'
BEGIN
UPDATE CURDSP SET Name = @Name ,Age = @Age ,Address = @Address WHERE ID = @ID;
END;


IF @Type = 'DELETE'
BEGIN
DELETE FROM CURDSP WHERE ID = @ID;
END;


END;