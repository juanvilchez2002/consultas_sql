-- Ejercicios de Aprendizaje

-- bd personal
use personal;

-- obtener los datos completos de los empleados
select * from empleados;

-- obtener los datos completos de los departamentos
select * from departamentos;

-- listar el nombre de los departamentos
select distinct(nombre_depto) from departamentos;

-- obtener los datos de los empleados cuyo cargo sea 'Secretaria'
select * from empleados where cargo_emp like '%creta%';
select * from empleados where cargo_emp = 'Secretaria';

-- obtener los datos de los epleados venderores, ordenados por nombre alfabeticamente
select nombre, cargo_emp from empleados where cargo_emp = 'Vendedor' order by nombre;

-- obterner el nombre de o de los jefes que tengan su departamento situado en la ciudad de 'CIUDAD REAL'
select nombre_jefe_depto from departamentos where ciudad = 'CIUDAD REAL';

-- elaborar un listado donde para cada fila, figure el alias nombre y cargo para los respectivos empleados
select nombre as Nombre, cargo_emp as Cargo from empleados;

-- listar los salarios y comisiones de los empleados del departamento 2000, ordenando por comision de menor a mayor
select nombre, sal_emp, comision_emp from empleados where id_depto = 2000 order by comision_emp;

-- obtener el valor total a pagar a cada empleado del departamento 3000 que resulta de sumar salario y la comision mas una bonificacion
-- de 500, mosrar el nombre del empleado y el total a pagar en orden alfabetico
select nombre, (sal_emp+comision_emp+500) as total_pagar from empleados where id_depto = 3000 order by nombre;

-- mostrar los empleados cuyo nombre inicie con J
select * from empleados where nombre like 'J%';

-- listar el salario, comision, salario total (salario + comision) y nombre de aquellos empleados que tienen comision superior a 1000
select nombre, sal_emp, comision_emp, (sal_emp+comision_emp) as total_pagar from empleados where comision_emp > 10000;

-- obtener un listado similar an anterior pero de aquellos empleados que no tiene comision
select nombre, sal_emp, comision_emp, (sal_emp+comision_emp) as total_pagar from empleados where comision_emp = 0;

-- obtener un listado de los empleados que ganan una comision superior a su sueldo
select * from empleados where comision_emp > sal_emp;

-- listar los empleados cuya comision es menor o igual que el 30% de su sueldo
select *, (sal_emp*0.3) as cond from empleados where comision_emp <= (sal_emp*0.3);

-- hallar los empleados cuyo nombre no contiene la cadena MA
select * from empleados where nombre not like  '%ma%';

-- obtener los nombres de los departamentos que sean ventas, investigacióo o mantenimiento
select distinct nombre_depto from departamentos where nombre_depto in ('VENTAS', 'INVESTIGACION', 'MANTENIMIENTO');

-- ahora obtener el contrario, nombre de los departamentos que no sean ventas, investigacióo o mantenimiento
select distinct nombre_depto from departamentos where nombre_depto not in ('VENTAS', 'INVESTIGACION', 'MANTENIMIENTO');

-- mostrar el salario mas alto de la empresa
select max(sal_emp) as suel_max from empleados;

-- mostrar el nombde del ultimo empleado de la lista por orden alfabetico
select * from empleados order by nombre desc limit 1;

-- mostrar el salario mas alto y el mas bajo y su diferencia
select max(sal_emp) as suel_max, min(sal_emp) as suel_min, (max(sal_emp)-min(sal_emp)) as dif_max_min from empleados;

-- mostrar el salario promedio por departamento
select id_depto, avg(sal_emp) as prom_suel from empleados group by id_depto;

-- hallar los departamentos que tiene mas de tres empleados, mostrar el numero de empleados de esos departamentos
select if(grouping(id_depto), 'Total', id_depto) as dep, count(id_emp) as cantidad from empleados group by id_depto having count(id_emp)>3 ;
select id_depto, count(id_emp) as cantidad from empleados group by id_depto having count(id_emp)>3;

-- hallar los departamentos que no tienen empleados
select * from departamentos d left join empleados e on d.id_depto = e.id_depto where e.id_depto is null;

-- mostrar una lista de empleados cuyo salario es mayor o igul que el salario promedio de la empresa, ordenarlo por departamento
select e.nombre, e.sal_emp, d.nombre_depto from empleados e inner join departamentos d on e.id_depto = d.id_depto where e.sal_emp <= (select avg(sal_emp) from empleados) order by d.nombre_depto;