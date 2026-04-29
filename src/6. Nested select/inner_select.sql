USE domova_kniga;
SELECT first_name, last_name, phone_number
FROM residents
WHERE apartment_id IN (
    SELECT apartment_id 
    FROM fees 
    WHERE is_paid = 0 AND fee_year = 2026
);