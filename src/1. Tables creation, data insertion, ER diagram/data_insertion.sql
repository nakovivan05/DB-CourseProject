USE domova_kniga;

INSERT INTO users (username, password_hash, role) VALUES 
('admin_manager', 'scrypt:28000$admin$123456', 'admin'),
('ivan_ivanov', 'scrypt:28000$ivan$password', 'manager'),
('maria_petrova', 'scrypt:28000$maria$secret', 'manager');

INSERT INTO buildings (manager_id, address, city, total_floors) VALUES 
(2, 'ул. Слънчев бряг 12', 'София', 6),
(3, 'бул. Витоша 45', 'София', 4);

INSERT INTO apartments (building_id, apt_number, floor, area_sqm) VALUES 
(1, 'Ап. 1', 1, 65.00),
(1, 'Ап. 2', 1, 82.50),
(1, 'Ап. 3', 2, 70.00),
(2, 'Ап. 101', 1, 45.00),
(2, 'Ап. 102', 1, 55.00);

INSERT INTO residents (apartment_id, first_name, last_name, phone_number, is_owner) VALUES 
(1, 'Иван', 'Иванов', '0888111222', 1),   
(2, 'Мария', 'Петрова', '0888333444', 1), 
(2, 'Георги', 'Петров', '0888555666', 0),  
(4, 'Елена', 'Димитрова', '0899123456', 1); 

INSERT INTO repairs (building_id, title, description, status, cost, completion_date) VALUES 
(1, 'Ремонт на покрив', 'Подмяна на керемиди', 'completed', 2500.00, '2024-03-10'),
(1, 'Смяна на входна врата', 'Нова метална врата', 'planned', 900.00, NULL),
(2, 'Боядисване на стълбище', 'Етаж 1 и 2', 'in_progress', 600.00, NULL);

INSERT INTO fees (apartment_id, fee_month, fee_year, amount, is_paid, payment_date) VALUES 
(1, 4, 2024, 30.00, 1, '2024-04-05'), 
(2, 4, 2024, 35.00, 0, NULL),         
(4, 4, 2024, 25.00, 1, '2024-04-02'); 