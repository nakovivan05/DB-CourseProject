DELIMITER //

CREATE PROCEDURE GetBuildingDebt(IN b_id INT, OUT total_debt DECIMAL(10,2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_amount DECIMAL(10,2);
    DECLARE current_sum DECIMAL(10,2) DEFAULT 0.00;
    DECLARE debt_cursor CURSOR FOR 
        SELECT f.amount 
        FROM fees f
        JOIN apartments a ON f.apartment_id = a.id
        WHERE a.building_id = b_id AND f.is_paid = 0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN debt_cursor;
    read_loop: LOOP
        FETCH debt_cursor INTO current_amount;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET current_sum = current_sum + current_amount;
    END LOOP;
    CLOSE debt_cursor;
    SET total_debt = current_sum;
END //

DELIMITER ;

CALL GetBuildingDebt(1, @total);
SELECT @total AS 'Debt for building 1';