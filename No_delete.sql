use classicmodels;
DROP TRIGGER IF EXISTS No_delete_order;
DELIMITER $$
CREATE TRIGGER No_delete_order
   BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
   If Old.orderNumber is not null then
   SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'Este registro no lo puedes eliminar';
End If;
END$$
DELIMITER ;

Delete from orders
where orders.orderNumber=10104;





DROP TRIGGER IF EXISTS No_delete_payments;
DELIMITER $$
CREATE TRIGGER No_delete_payments
   BEFORE DELETE ON payments
FOR EACH ROW
BEGIN
   If Old.checkNumber is not null then
   SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'Este dato no se puede borrar';
End If;
END$$
DELIMITER ;

Delete from payments
where payments.customerNumber=112;