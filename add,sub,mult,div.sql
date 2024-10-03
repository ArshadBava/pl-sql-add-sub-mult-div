DELIMITER $$
CREATE PROCEDURE calculate(
    IN num1 FLOAT,
    IN num2 FLOAT,
    IN operation VARCHAR(10),
    OUT result FLOAT
)
BEGIN
    CASE operation
        WHEN 'add' THEN
            SET result = num1 + num2;
        WHEN 'subtract' THEN
            SET result = num1 - num2;
        WHEN 'multiply' THEN
            SET result = num1 * num2;
        WHEN 'divide' THEN
            IF num2 != 0 THEN
                SET result = num1 / num2;
            ELSE
                SET result = NULL; 
            END IF;
        ELSE
            SET result = NULL; 
    END CASE;
END $$
DELIMITER ;


SET @result = 0;
CALL calculate(10, 5, 'add', @result);
SELECT @result AS Result; 

CALL calculate(12, 3, 'subtract', @result);
SELECT @result AS Result;  

CALL calculate(5, 4, 'multiply', @result);
SELECT @result AS Result;  

CALL calculate(10, 2, 'divide', @result);
SELECT @result AS Result;  

CALL calculate(10, 0, 'divide', @result);
SELECT @result AS Result;  
