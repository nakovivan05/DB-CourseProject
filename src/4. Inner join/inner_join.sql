USE domova_kniga;
SELECT apartments.apt_number AS apartment, CONCAT(residents.first_name, " ", residents.last_name) AS owner
FROM apartments
JOIN residents ON apartments.id = residents.apartment_id
WHERE residents.is_owner = 1;
