USE domova_kniga;
SELECT 
    apartments.apt_number AS apartment, 
    buildings.address AS adress,
    apartments.area_sqm AS area,
    SUM(fees.amount) AS payments_overall
FROM apartments
JOIN buildings ON apartments.building_id = buildings.id
LEFT JOIN fees ON apartments.id = fees.apartment_id AND fees.is_paid = 1
GROUP BY apartments.id, apartments.apt_number, buildings.address, apartments.area_sqm;
