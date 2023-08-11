--
use superheroes;
-- ingresando dos registros a la tabla 
insert into creador values (1, 'Marvel'), (2, 'DC Comics');
--
select * from creador;
-- ingresando registros a la tabla personaje
insert into personajes values (1,'Bruce Banner', 'Hulk', 160, '600 mil', 75, 98, 1962, 'Fisico Nuclear', 1);
insert into personajes values (2, 'Tony Stark', 'Iron Man', 170, '200 mil', 70, 123, 1963, 'Inventor Industrial',1),
(3, 'Thor Odinson', 'Thor', 145, 'infinita', 100, 235, 1962, 'Rey de Asgard',1), 
(4, 'Wanda Maximoft', 'Bruja Escarlata', 170, '100 mil', 90, 345, 1964, 'Bruja',1), 
(5, 'Carol Danvers', 'Capitana Marvel', 157, '250 mil', 85, 128, 1968, 'Oficial de Inteligencia',1), 
(6, 'Thanos', 'Thanos', 170, 'infinita', 40, 306, 1973, 'Adorador de la Muerte',1), 
(7, 'Peter Parker', 'Spiderman', 165, '25 mil', 80, 74, 1962, 'Fotografo',1), 
(8, 'Steve Rogers', 'Capitan America', 145, '600', 45, 60, 1961, 'Oficial Federal',1), 
(9, 'Bobby Drake', 'Ice Man', 140, '2 mil', 64, 122, 1963, 'Contador',1), 
(10, 'Barry Allen', 'Flash', 160, '10 mil', 120, 168, 1956, 'Cientifico Forense',2), 
(11, 'Bruce Wayne', 'Batman', 170, '500', 32, 47, 1939, 'Hombre de Negocios',2), 
(12, 'Clark Kent', 'Superman', 165, 'infinita', 120, 182, 1948, 'Reportero',2), 
(13, 'Diana Prince', 'Mujer Maravilla', 160, 'infinita', 95, 127, 1949, 'Princesa Guerrera',2);

-- cambiar la fecha de aparicion de superman a 1938
update personajes set aparicion = 1938 where id_personaje = 12;
select * from personajes where id_personaje = 12;

-- eliminar el registro que contiene el personaje flash
delete from personajes where id_personaje=10;
select * from personajes;

-- ordenando los registros de personaje por inteligencia y ascendente
select * from personajes order by inteligencia asc;