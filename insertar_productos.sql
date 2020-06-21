use classicmodels;
drop table if exists logProducts;
create table logProducts(
id int auto_increment,
productCode VARCHAR(15),
dateLog TIMESTAMP DEFAULT NOW(),
descripcion VARCHAR(255) NOT NULL,
PRIMARY KEY (id, productCode));
DROP TRIGGER IF EXISTS after_inserts_products;
DELIMITER $$

create trigger after_inserts_products
after insert on products
for each row
Begin
		INSERT INTO logProducts(productCode, descripcion)
        VALUES (new.productCode, CONCAT('Se ha insertado un nuevo producto: ', NEW.productName));
End$$
DELIMITER ; 

INSERT INTO products(productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
VALUES('S72_3213','Nuevo producto','Planes','1:72','Artefacta','Nuevo producto',4554,15.51,51.51);
SELECT * FROM classicmodels. logProducts;