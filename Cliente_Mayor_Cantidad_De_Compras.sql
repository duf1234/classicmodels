
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `classicmodels`.`Cliente_Mayor_Cantidad_De_Compras` AS
    SELECT 
         `customers`.`customerName` AS `Nombre_Del_Cliente`, COUNT(`orders`.`customerNumber`) AS `Cantidad_Pedidos`,
        SUM(`orderdetails`.`quantityOrdered` * `orderdetails`.`priceEach`) AS `Valor_Pagado_Por_Total_Compra`,
        COUNT(DISTINCT `orderdetails`.`productCode`) AS `Cantidad_De_Productos_Diferentes`
    FROM
        ((`classicmodels`.`customers`
        JOIN `classicmodels`.`orders`)
        JOIN `classicmodels`.`orderdetails`)
    WHERE
        `customers`.`customerNumber` = `orders`.`customerNumber`
            AND `orders`.`orderNumber` = `orderdetails`.`orderNumber`
            AND `orders`.`orderDate` BETWEEN '2003-01-06' and '2005-05-30' 
    GROUP BY `customers`.`customerNumber`
    ORDER BY COUNT(`orders`.`customerNumber`) DESC
    LIMIT 1