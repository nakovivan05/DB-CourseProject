USE domova_kniga;
SELECT 
    buildings.address AS building, 
    COUNT(repairs.id) AS number_of_repairs,
    SUM(repairs.cost) AS total_repair_cost
FROM buildings 
JOIN repairs  ON buildings.id = repairs.building_id
WHERE repairs.status = 'completed'
GROUP BY buildings.id, buildings.address;