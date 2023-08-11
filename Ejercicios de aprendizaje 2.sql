--
use tienda;

-- listar el nombre de todos los productos q hay en la tabla producto
select nombre from producto;

-- lista los nombres y precios de todos los productos de la tabla producto
select nombre, precio from producto;

-- lista todas las columnas de la tabla producto
select * from producto;

-- listar los nombres y los precios de todos los productos y redondear el precio
select nombre, round(precio) from producto;

-- lista el código de los fabricantes q tienen productos en la tabla producto
select codigo_fabricante from producto;

-- lista el código de los fabricantes q tienen productos en la tabla producto, sin mostrar repetidos
select distinct(codigo_fabricante) from producto;

-- lista los nombres de los fabricantes ordenados de forma ascendene
select nombre from fabricante order by nombre asc

-- lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente
-- y en segundo lugar por el precio de forma descendente
select nombre, precio from producto order by nombre asc, precio desc;

-- devuele una lista con los 5 primeras filas de la tabla fabricante
select * from fabricante limit 5; 

-- lista el nombre y el precio del producto mas barato (utilice solamente las clausula order by y limit)
select * from producto order by precio asc limit 1;

-- lista el nombre y el precio del producto mas caro (utilice solamente las clausula order by y limit)
select * from producto order by precio desc limit 1;

-- listar el producto que tienen un precio menor o igual a 120
select * from producto where precio <= 120;

-- listar todos los productos q tienen un precio entre 60 y 200
select * from producto where precio between 60 and 200;

-- lista todos los productos dnd el código de fabricante sea 1,3 o 5, use operador IN
select * from producto where codigo_fabricante in (1, 3, 5);

-- devuelve una lista con el nombre de todos los productos q contienen la cadena Portatil en el nombre
select * from producto where nombre like '%portatil%';

-- devuelve una lista con el codigo del producto, nombre del producto, codigo del fabricante y nombre del fabricante, de todos
-- los productos de la bd
select p.codigo, p.nombre, f.codigo, f.nombre
from producto p inner join fabricante f on p.codigo_fabricante = f.codigo

-- devuelve una lista con el codigo del producto, nombre del producto, codigo del fabricante y nombre del fabricante, de todos
-- los productos de la bd, ordene el resultado por el nombre del fabricante
select p.codigo, p.nombre, f.codigo, f.nombre from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo order by f.nombre;

-- devuelve el nombre del producto, su precio, fabricante del producto mas barato
select p.codigo, p.nombre, p.precio, f.codigo, f.nombre from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo order by p.precio asc limit 1;

-- devuelve una lista de todos los productos del fabricante lenovo
select p.codigo, p.nombre, p.precio, f.codigo, f.nombre from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre like '%lenovo%';

-- devuelve una lista de todos los productos del fabricante Crucial q tengan un precio mayor a 200
select p.codigo, p.nombre, p.precio, f.codigo, f.nombre from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre like '%crucial%' and p.precio > 200;

-- devuelve una lista con todos los productos de los fabricantes Asus, Hewlett-Packart usando el operador IN
select p.codigo, p.nombre, p.precio, f.codigo, f.nombre from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre in ('Asus', 'Hewlett-Packard');

-- devuelve un listado conel nombre producto, precio, nombre de fabricante de todos los productos q contengan
-- un precio mayor o igual a 180, ordene el resultado en primer lugar por el precio de forma descendente, y segundo
-- lugar por el nombre x orden ascendente
select p.codigo, p.nombre, p.precio, f.codigo, f.nombre from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo where p.precio >=180 order by p.precio desc, f.nombre asc;

-- devuelve un listado de todos los fabricantes q existen en la bd junto con los productos q tiene cada uno de ellos
-- el listado debera mostrar tmb aquellos fabricantes q no tienen productos asociados
select  f.*, p.* from fabricante f left join producto p on f.codigo = p.codigo_fabricante;

-- devuelve un listado de todos los fabricantes no tienen un producto asociado
select  f.*, p.* from fabricante f left join producto p on f.codigo = p.codigo_fabricante where p.codigo_fabricante is null;

-- devuelve todos los productos del fabricante Lenovo sin usar inner joun
select * from producto where codigo_fabricante in (2);
select * from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo');

-- devuelve todos los datos de los poductos que tienen el mismo precio que el producto mas caro del 
-- fabricante lenovo
select * from producto where precio = (select max(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));

-- lista todos los productos del fabricante Asus q tiene tienen un precio superior al precio medio de todos los productos
select * from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Asus') and precio > (select avg(precio) from producto );
select * from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Asus') and precio > (select avg(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Asus'));

-- devuelve un listado con todos los nombre de los fabricantes q tienen el mismo numero de productos
-- que el fabricante Lenovo
select f.nombre , count(f.codigo) as cantidad from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo 
group by f.nombre
having cantidad = (select count(f.codigo) as cantidad from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo  where f.nombre = 'Lenovo'
group by f.nombre)



