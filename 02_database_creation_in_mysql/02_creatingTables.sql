CREATE TABLE customer_contact(
    customer_contact_id INT PRIMARY KEY AUTO_INCREMENT, 
    customer_address VARCHAR(85) NOT NULL, 
    customer_zip INT NOT NULL, 
    customer_city VARCHAR(55) NOT NULL, 
    customer_phone BIGINT NOT NULL UNIQUE, 
    customer_email VARCHAR(55) NOT NULL UNIQUE
);

DESCRIBE customer_contact;

CREATE TABLE sender(
    sender_id INT PRIMARY KEY AUTO_INCREMENT, 
    fk_customer_contact_id INT NOT NULL, 
    sender_fname VARCHAR(55) NOT NULL, 
    sender_lname VARCHAR(55), 
    FOREIGN KEY (fk_customer_contact_id) REFERENCES customer_contact(customer_contact_id)
);

DESCRIBE sender;

CREATE TABLE receiver(
    receiver_id INT PRIMARY KEY AUTO_INCREMENT, 
    fk_customer_contact_id INT NOT NULL, 
    receiver_fname VARCHAR(55) NOT NULL, 
    receiver_lname VARCHAR(55), 
    FOREIGN KEY (fk_customer_contact_id) REFERENCES customer_contact(customer_contact_id) 
);

DESCRIBE receiver;

CREATE TABLE location_type(
    location_type_id INT PRIMARY KEY AUTO_INCREMENT, 
    location_type ENUM('office', 'pick-up') NOT NULL
);

DESCRIBE location_type;

CREATE TABLE location_address(
    location_address_id INT PRIMARY KEY AUTO_INCREMENT, 
    location_address VARCHAR(85) NOT NULL, 
    location_zip INT NOT NULL, 
    location_city VARCHAR(85) NOT NULL
);

DESCRIBE location_address;

CREATE TABLE location(
    location_id INT PRIMARY KEY AUTO_INCREMENT, 
    fk_location_address_id INT NOT NULL, 
    fk_location_type_id INT NOT NULL, 
    FOREIGN KEY (fk_location_address_id) REFERENCES location_address(location_address_id), 
    FOREIGN KEY (fk_location_type_id) REFERENCES location_type(location_type_id)
);

DESCRIBE location;

CREATE TABLE employee_type(
    employee_type_id INT PRIMARY KEY AUTO_INCREMENT, 
    employee_type ENUM('office-worker', 'sorter', 'delivery') NOT NULL
);

DESCRIBE employee_type;

CREATE TABLE employee_contact(
    employee_contact_id INT PRIMARY KEY AUTO_INCREMENT, 
    employee_address VARCHAR(85) NOT NULL, 
    employee_zip INT NOT NULL, 
    employee_city VARCHAR(55) NOT NULL, 
    employee_phone BIGINT NOT NULL UNIQUE, 
    employee_email VARCHAR(55) NOT NULL UNIQUE
);


DESCRIBE employee_contact;

CREATE TABLE employee(
    employee_id INT PRIMARY KEY AUTO_INCREMENT, 
    fk_location_id INT NOT NULL, 
    fk_employee_contact_id INT NOT NULL, 
    fk_employee_type_id INT NOT NULL, 
    employee_fname VARCHAR(55) NOT NULL, 
    employee_lname VARCHAR(55) NOT NULL, 
    FOREIGN KEY (fk_location_id) REFERENCES location(location_id), 
    FOREIGN KEY (fk_employee_contact_id) REFERENCES employee_contact(employee_contact_id), 
    FOREIGN KEY (fk_employee_type_id) REFERENCES employee_type(employee_type_id)
);

DESCRIBE employee;

CREATE TABLE package_type(
    package_type_id INT PRIMARY KEY AUTO_INCREMENT, 
    package_type ENUM('letter', 'small-pkg', 'medium-pkg', 'big-pkg') NOT NULL, 
    max_weight INT NOT NULL
);

DESCRIBE package_type;

CREATE TABLE package(
    package_id INT PRIMARY KEY AUTO_INCREMENT, 
    fk_sender_id INT NOT NULL, 
    fk_receiver_id INT NOT NULL, 
    fk_employee_id INT NOT NULL, 
    fk_location_id INT NOT NULL, 
    fk_package_type_id INT NOT NULL, 
    package_weight INT NOT NULL, 
    send_date DATETIME NOT NULL, 
    received BOOLEAN NOT NULL DEFAULT FALSE, 
    FOREIGN KEY (fk_sender_id) REFERENCES sender(sender_id), 
    FOREIGN KEY (fk_receiver_id) REFERENCES receiver(receiver_id), 
    FOREIGN KEY (fk_employee_id) REFERENCES employee(employee_id), 
    FOREIGN KEY (fk_location_id) REFERENCES location(location_id), 
    FOREIGN KEY (fk_package_type_id) REFERENCES package_type(package_type_id)
);

DESCRIBE package;

CREATE TABLE sort(
    sort_id INT PRIMARY KEY AUTO_INCREMENT, 
    fk_employee_id INT NOT NULL, 
    fk_package_id INT NOT NULL UNIQUE, 
    sort_date DATETIME NOT NULL, 
    FOREIGN KEY (fk_employee_id) REFERENCES employee(employee_id), 
    FOREIGN KEY (fk_package_id) REFERENCES package(package_id)
);

DESCRIBE sort;

CREATE TABLE delivery(
    delivery_id INT PRIMARY KEY AUTO_INCREMENT, 
    fk_employee_id INT NOT NULL, 
    fk_package_id INT NOT NULL UNIQUE, 
    delivery_time DATETIME NOT NULL, 
    FOREIGN KEY (fk_employee_id) REFERENCES employee(employee_id), 
    FOREIGN KEY (fk_package_id) REFERENCES package(package_id)
);

DESCRIBE delivery;

