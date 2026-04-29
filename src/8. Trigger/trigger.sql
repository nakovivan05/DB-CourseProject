USE domova_kniga;

DELIMITER //

CREATE TRIGGER tr_fees_before_update
BEFORE UPDATE ON fees
FOR EACH ROW
BEGIN
    IF OLD.is_paid = 0 AND NEW.is_paid = 1 THEN
        SET NEW.payment_date = CURDATE();
    END IF;
END //

DELIMITER ;

UPDATE fees SET is_paid = 1 WHERE id = 78;
SELECT * from fees;