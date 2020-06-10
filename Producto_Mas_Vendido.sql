CREATE VIEW `Producto_Mas_Vendido` AS
select products.productName as Nombre_Producto, products.productLine as Nombre_De_Linia_Producto, sum(orderdetails.quantityOrdered*orderdetails.priceEach) as VentaTotal,
 count(orders.customerNumber) Clientes_Distintos
from products
inner join orderdetails on products.productCode=orderdetails.productCode 
inner join orders on orders.orderNumber=orderdetails.orderNumber

group by products.productCode
order by VentaTotal desc
limit 1;