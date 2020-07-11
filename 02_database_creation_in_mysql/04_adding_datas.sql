ALTER TABLE customer_contact AUTO_INCREMENT = 1

-- Inserting Data into customer_contact table
INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Baker Str. 1', 12540, 'Vienna', 06643542257, 'customer1@gmail.com');

INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Some Str. 14', 12140, 'Vienna', 06643765757, 'customer2@gmail.com');

INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Schonbrunn Str. 18', 18540, 'Vienna', 06642142257, 'customer3@gmail.com');

INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Ottakringer Str. 17/54', 12510, 'Vienna', 06643543217, 'customer4@gmail.com');

INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Wiener Str. 155/74', 12500, 'Vienna', 06643542123, 'customer5@gmail.com');

INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Wienerberg Str. 55/82', 12501, 'Vienna', 06643542120, 'customer6@gmail.com');

INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Prater Str. 12/1', 10500, 'Vienna', 06640542123, 'customer7@gmail.com');

INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Walter Str. 155/74', 11500, 'Vienna', 06643042123, 'customer8@gmail.com');

INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Mariahilfer Str. 5/74', 18500, 'Vienna', 06643542023, 'customer9@gmail.com');

INSERT INTO customer_contact(customer_address, customer_zip, customer_city, customer_phone, customer_email)
VALUES('Wiener Str. 155/74', 12502, 'Vienna', 06641542123, 'customer10@gmail.com');



-- Inserting Data into sender table
INSERT INTO sender(fk_customer_contact_id, sender_fname, sender_lname)
VALUES(1, 'Paul', 'Brenner');

INSERT INTO sender(fk_customer_contact_id, sender_fname, sender_lname)
VALUES(2, 'Vivien', 'Madison');

INSERT INTO sender(fk_customer_contact_id, sender_fname, sender_lname)
VALUES(3, 'Gerhard', 'Muller');

INSERT INTO sender(fk_customer_contact_id, sender_fname, sender_lname)
VALUES(4, 'Tamara', 'Berg');

INSERT INTO sender(fk_customer_contact_id, sender_fname, sender_lname)
VALUES(5, 'Johnny', 'Cash');

-- Inserting Data into receiver table

INSERT INTO receiver(fk_customer_contact_id, receiver_fname, receiver_lname)
VALUES(6, 'Jenny', 'Brenner');

INSERT INTO receiver(fk_customer_contact_id, receiver_fname, receiver_lname)
VALUES(7, 'Collie', 'Madison');

INSERT INTO receiver(fk_customer_contact_id, receiver_fname, receiver_lname)
VALUES(8, 'Thomas', 'Muller');

INSERT INTO receiver(fk_customer_contact_id, receiver_fname, receiver_lname)
VALUES(9, 'Timi', 'Berg');

INSERT INTO receiver(fk_customer_contact_id, receiver_fname, receiver_lname)
VALUES(10, 'Lola', 'Cash');

-- Insert Data into location_type
INSERT INTO location_type(location_type)
VALUES('office');

INSERT INTO location_type(location_type)
VALUES('pick-up');

-- Insert Data into location_address
INSERT INTO location_address(location_address, location_zip, location_city)
VALUES('Post Str. 1', 11000, 'Vienna');

INSERT INTO location_address(location_address, location_zip, location_city)
VALUES('Post Str. 20', 11000, 'Vienna');

INSERT INTO location_address(location_address, location_zip, location_city)
VALUES('Pick-up Str. 12', 11000, 'Vienna');

INSERT INTO location_address(location_address, location_zip, location_city)
VALUES('Pick-up Str. 55', 11000, 'Vienna');

-- Insert Data into location
INSERT INTO location(fk_location_address_id, fk_location_type_id) 
VALUES(1, 1);

INSERT INTO location(fk_location_address_id, fk_location_type_id) 
VALUES(2, 1);

INSERT INTO location(fk_location_address_id, fk_location_type_id) 
VALUES(3, 2);

INSERT INTO location(fk_location_address_id, fk_location_type_id) 
VALUES(4, 2);

-- Insert Data into employee_type
INSERT INTO employee_type(employee_type)
VALUES('office-worker');

INSERT INTO employee_type(employee_type)
VALUES('sorter');

INSERT INTO employee_type(employee_type)
VALUES('delivery');

-- Insert Data into employee_contact
INSERT INTO employee_contact(employee_address, employee_zip, employee_city, employee_phone, employee_email)
VALUES('Employee Str 25/45', 12541, 'Vienna', 06642105587, 'employee1@post.com');

INSERT INTO employee_contact(employee_address, employee_zip, employee_city, employee_phone, employee_email)
VALUES('Employee Str 15/45', 12541, 'Vienna', 06642107587, 'employee2@post.com');

INSERT INTO employee_contact(employee_address, employee_zip, employee_city, employee_phone, employee_email)
VALUES('Employee Str 85/45', 12541, 'Vienna', 06642102587, 'employee3@post.com');

INSERT INTO employee_contact(employee_address, employee_zip, employee_city, employee_phone, employee_email)
VALUES('Employee Str 75/45', 12541, 'Vienna', 06642100587, 'employee4@post.com');

INSERT INTO employee_contact(employee_address, employee_zip, employee_city, employee_phone, employee_email)
VALUES('Employee Str 35/45', 12541, 'Vienna', 06642109587, 'employee5@post.com');

INSERT INTO employee_contact(employee_address, employee_zip, employee_city, employee_phone, employee_email)
VALUES('Employee Str 55/45', 12541, 'Vienna', 06642102287, 'employee6@post.com');

-- Insert Data to employee
INSERT INTO employee(fk_location_id, fk_employee_contact_id, fk_employee_type_id, employee_fname, employee_lname)
VALUES(1, 1, 1, 'Kethrin', 'Postal');

INSERT INTO employee(fk_location_id, fk_employee_contact_id, fk_employee_type_id, employee_fname, employee_lname)
VALUES(3, 2, 1, 'Johnny', 'Postal');

INSERT INTO employee(fk_location_id, fk_employee_contact_id, fk_employee_type_id, employee_fname, employee_lname)
VALUES(1, 3, 2, 'Manu', 'Sorter');

INSERT INTO employee(fk_location_id, fk_employee_contact_id, fk_employee_type_id, employee_fname, employee_lname)
VALUES(3, 4, 2, 'Jack', 'Sorter');

INSERT INTO employee(fk_location_id, fk_employee_contact_id, fk_employee_type_id, employee_fname, employee_lname)
VALUES(1, 5, 3, 'Thomas', 'Delivery');

INSERT INTO employee(fk_location_id, fk_employee_contact_id, fk_employee_type_id, employee_fname, employee_lname)
VALUES(3, 6, 3, 'Matthias', 'Delivery');

-- Insert Data to package_type

INSERT INTO package_type(package_type, max_weight) 
VALUES('letter', 200);

INSERT INTO package_type(package_type, max_weight) 
VALUES('small-pkg', 1500);

INSERT INTO package_type(package_type, max_weight) 
VALUES('medium-pkg', 3000);

INSERT INTO package_type(package_type, max_weight) 
VALUES('big-pkg', 10000);

-- Inserting Data to package

ALTER TABLE package AUTO_INCREMENT = 1

INSERT INTO package(fk_sender_id, fk_receiver_id, fk_employee_id, fk_location_id, fk_package_type_id, package_weight, send_date)
VALUES(1, 1, 1, 1, 1, 180, '2020-04-14 12:00:00');

INSERT INTO package(fk_sender_id, fk_receiver_id, fk_employee_id, fk_location_id, fk_package_type_id, package_weight, send_date)
VALUES(2, 2, 2, 3, 2, 1400, '2020-05-11 12:00:00');

INSERT INTO package(fk_sender_id, fk_receiver_id, fk_employee_id, fk_location_id, fk_package_type_id, package_weight, send_date)
VALUES(3, 3, 1, 1, 3, 2500, '2020-06-24 14:30:50');

INSERT INTO package(fk_sender_id, fk_receiver_id, fk_employee_id, fk_location_id, fk_package_type_id, package_weight, send_date)
VALUES(4, 4, 2, 3, 4, 5000, '2020-05-11 14:30:50');

INSERT INTO package(fk_sender_id, fk_receiver_id, fk_employee_id, fk_location_id, fk_package_type_id, package_weight, send_date)
VALUES(1, 1, 1, 1, 1, 180, '2020-07-10 12:00:00');

INSERT INTO package(fk_sender_id, fk_receiver_id, fk_employee_id, fk_location_id, fk_package_type_id, package_weight, send_date)
VALUES(2, 2, 2, 3, 2, 1400, '2020-07-10 12:00:00');

INSERT INTO package(fk_sender_id, fk_receiver_id, fk_employee_id, fk_location_id, fk_package_type_id, package_weight, send_date)
VALUES(3, 3, 1, 1, 3, 2500, '2020-07-10 12:00:00');

INSERT INTO package(fk_sender_id, fk_receiver_id, fk_employee_id, fk_location_id, fk_package_type_id, package_weight, send_date)
VALUES(4, 4, 2, 3, 4, 5000, '2020-07-10 12:00:00');


-- Inserting Data into sort

ALTER TABLE sort AUTO_INCREMENT = 1;

INSERT INTO sort(fk_employee_id, fk_package_id, sort_date) 
VALUES(3, 1, '2020-04-15 12:00:00');

INSERT INTO sort(fk_employee_id, fk_package_id, sort_date) 
VALUES(4, 2, '2020-05-12 12:00:00');

INSERT INTO sort(fk_employee_id, fk_package_id, sort_date) 
VALUES(3, 3, '2020-06-25 14:30:50');

INSERT INTO sort(fk_employee_id, fk_package_id, sort_date) 
VALUES(4, 4, '2020-05-12 14:30:50');


-- Inserting Data into delviery

INSERT INTO delivery(fk_employee_id, fk_package_id, delivery_time) 
VALUES(5, 1, '2020-04-16 12:00:00');

INSERT INTO delivery(fk_employee_id, fk_package_id, delivery_time) 
VALUES(6, 2, '2020-05-13 12:00:00');

INSERT INTO delivery(fk_employee_id, fk_package_id, delivery_time) 
VALUES(5, 3, '2020-06-26 14:30:50');

INSERT INTO delivery(fk_employee_id, fk_package_id, delivery_time) 
VALUES(6, 4, '2020-05-13 14:30:50');

