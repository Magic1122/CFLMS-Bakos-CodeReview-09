-- Trigger to change package received from FALSE to TRUE when a delivery date is added
-- Must be added through cmd

DELIMITER $$
CREATE
TRIGGER set_delivered
AFTER INSERT ON delivery
FOR EACH ROW
BEGIN
   UPDATE package
   INNER JOIN delivery ON delivery.package_id = package.package_id
   SET package.received = TRUE
   WHERE delivery.package_id = package.package_id;
END$$
DELIMITER ;
