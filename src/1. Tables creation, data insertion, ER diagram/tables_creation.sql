CREATE DATABASE domova_kniga;
USE domova_kniga;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'manager') NOT NULL DEFAULT 'manager',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) Engine = InnoDB;
CREATE TABLE buildings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    manager_id INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    total_floors INT,
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES users(id) 
    ON DELETE RESTRICT ON UPDATE CASCADE
) Engine = InnoDB;
CREATE TABLE apartments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    building_id INT NOT NULL,
    apt_number VARCHAR(10) NOT NULL,
    floor INT,
    area_sqm DECIMAL(7,2),
    CONSTRAINT fk_building FOREIGN KEY (building_id) REFERENCES buildings(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
) Engine = InnoDB;
CREATE TABLE residents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    apartment_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    is_owner BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_apt_res FOREIGN KEY (apartment_id) REFERENCES apartments(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
) Engine = InnoDB;
CREATE TABLE repairs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    building_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    status ENUM('planned', 'in_progress', 'completed') DEFAULT 'planned',
    cost DECIMAL(10,2),
    completion_date DATE,
    CONSTRAINT fk_build_rep FOREIGN KEY (building_id) REFERENCES buildings(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
) Engine = InnoDB;
CREATE TABLE fees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    apartment_id INT NOT NULL,
    fee_month TINYINT NOT NULL, 
    fee_year YEAR NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    is_paid BOOLEAN DEFAULT FALSE,
    payment_date DATE,
    CONSTRAINT fk_apt_fee FOREIGN KEY (apartment_id) REFERENCES apartments(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
) Engine = InnoDB;
