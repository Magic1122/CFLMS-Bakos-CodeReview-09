-- Shows how many packages were sent
SELECT COUNT(*) AS total_packages
FROM package;

-- Shows package id, sending date, received status, weight, package type, sender name, receiver name and employee name who took the package
SELECT package.package_id, 
package.send_date, 
package.received, 
package.package_weight, 
package_type.package_type, 
sender.sender_fname, 
receiver.receiver_fname, 
employee.employee_fname
FROM package
JOIN package_type ON package.fk_package_type_id = package_type.package_type_id
JOIN sender ON  package.fk_sender_id = sender.sender_id
JOIN receiver ON package.fk_receiver_id = receiver.receiver_id
JOIN employee ON package.fk_employee_id = employee.employee_id;

-- Shows how many packages are not delivered
SELECT COUNT(*)
FROM package
WHERE package.received = FALSE;

-- Shows how many packages are delivered
SELECT COUNT(*)
FROM package
WHERE package.received = TRUE;

-- Shows sender name, receiver name, package id and weight that were send before 2020-06-06 12:00:00
SELECT sender.sender_fname, 
sender_lname,
receiver.receiver_fname, 
receiver.receiver_lname, 
package.package_id, 
package.package_weight
FROM package
JOIN sender ON  package.fk_sender_id = sender.sender_id
JOIN receiver ON package.fk_receiver_id = receiver.receiver_id 
WHERE package.send_date < '2020-06-06 12:00:00';

-- Shows employee type, and contact datas
SELECT employee_type.employee_type, 
employee.employee_fname, 
employee.employee_lname, 
employee_contact.employee_address, 
employee_contact.employee_zip, 
employee_contact.employee_city, 
employee_contact.employee_phone
FROM employee
JOIN employee_contact ON employee.fk_employee_contact_id = employee_contact.employee_contact_id 
JOIN employee_type ON employee_type.employee_type_id = employee.fk_employee_type_id;

-- Shows employee type, and contact datas for office workers
SELECT employee_type.employee_type, 
employee.employee_fname, 
employee.employee_lname, 
employee_contact.employee_address, 
employee_contact.employee_zip, 
employee_contact.employee_city, 
employee_contact.employee_phone
FROM employee
JOIN employee_contact ON employee.fk_employee_contact_id = employee_contact.employee_contact_id 
JOIN employee_type ON employee_type.employee_type_id = employee.fk_employee_type_id
WHERE employee_type.employee_type = 'office-worker';

-- Shows employee type, and contact datas for sorters
SELECT employee_type.employee_type, 
employee.employee_fname, 
employee.employee_lname, 
employee_contact.employee_address, 
employee_contact.employee_zip,employee_contact.employee_city, 
employee_contact.employee_phone
FROM employee
JOIN employee_contact ON employee.fk_employee_contact_id = employee_contact.employee_contact_id 
JOIN employee_type ON employee_type.employee_type_id = employee.fk_employee_type_id
WHERE employee_type.employee_type = 'sorter';

-- Shows employee type, and contact datas for delivery employees
SELECT employee_type.employee_type, 
employee.employee_fname, 
employee.employee_lname, 
employee_contact.employee_address, 
employee_contact.employee_zip,employee_contact.employee_city, 
employee_contact.employee_phone
FROM employee
JOIN employee_contact ON employee.fk_employee_contact_id = employee_contact.employee_contact_id 
JOIN employee_type ON employee_type.employee_type_id = employee.fk_employee_type_id
WHERE employee_type.employee_type = 'delivery';

-- Show how many packages were sent from Vienna
SELECT COUNT(*)
FROM package
JOIN sender ON package.fk_sender_id = sender.sender_id
JOIN customer_contact ON sender.fk_customer_contact_id = customer_contact.customer_contact_id
WHERE customer_contact.customer_city = 'Vienna';

-- Shows who sent packages between 2020-04-14 12:00:00 and 2020-05-11 12:00:00 and to who
SELECT sender.sender_fname, 
sender.sender_lname, 
receiver.receiver_fname, 
receiver.receiver_lname
FROM package
JOIN receiver ON receiver.receiver_id = package.fk_receiver_id
JOIN sender ON sender.sender_id = package.fk_sender_id
WHERE package.send_date BETWEEN '2020-04-14 12:00:00' AND '2020-05-11 12:00:00';

-- Shows names and street of customers whos street name includes Wien
SELECT sender.sender_fname, 
receiver.receiver_fname, 
customer_contact.customer_address
FROM customer_contact
LEFT JOIN sender ON sender.fk_customer_contact_id = customer_contact.customer_contact_id
LEFT JOIN receiver ON receiver.fk_customer_contact_id = customer_contact.customer_contact_id
WHERE customer_contact.customer_address LIKE '%Wien%';

-- Shows package infos for package id 1
SELECT sender.sender_fname, 
sender.sender_lname, 
receiver.receiver_fname, 
receiver.receiver_lname, 
package.package_weight, 
package_type.package_type, 
package.send_date, 
sort.sort_date, 
delivery.delivery_time, 
employee.employee_lname, 
employee.employee_fname
FROM package
JOIN package_type ON package.fk_package_type_id = package_type.package_type_id
JOIN sender ON sender.sender_id = package.fk_sender_id
JOIN receiver ON receiver.receiver_id = package.fk_receiver_id
JOIN employee ON package.fk_employee_id = employee.employee_id
JOIN sort ON package.package_id = sort.sort_id
JOIN delivery ON package.package_id = delivery.fk_package_id
WHERE package.package_id = 1;

-- Shows package infos for package less than id number 5
SELECT sender.sender_fname, 
sender.sender_lname, 
receiver.receiver_fname, 
receiver.receiver_lname, 
package.package_weight, 
package_type.package_type, 
package.send_date, 
sort.sort_date, 
delivery.delivery_time, 
employee.employee_lname AS delivery_employee_lname, 
employee.employee_fname AS delivery_employee_fname
FROM package
JOIN package_type ON package.fk_package_type_id = package_type.package_type_id
JOIN sender ON sender.sender_id = package.fk_sender_id
JOIN receiver ON receiver.receiver_id = package.fk_receiver_id
JOIN sort ON package.package_id = sort.sort_id
JOIN delivery ON package.package_id = delivery.fk_package_id
JOIN employee ON delivery.fk_employee_id = employee.employee_id
WHERE package.package_id < 5;


