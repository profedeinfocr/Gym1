--crear base de datos
create database Gym1

drop table User_Master

create table Client_Master(
email varchar (30) unique, --consecutivo usuario
nombre varchar(50),
apellidos varchar(50),
telefono varchar(50),
fecha_nacimiento datetime,
CONSTRAINT PK_email PRIMARY KEY (email) )

INSERT INTO Client_Master (email, nombre, apellidos, telefono, fecha_nacimiento) 
values ('Ana@UH.cr','Ana', 'Anaiz', 1111, '1981-01-01'),
		('Beli@uh.cr','Belinda', 'Brenes', 2222, '1982-02-02'),
		('Carla@uh.cr','Carla', 'Carolingia', 3333, '1983-03-03'),
		('Gaitan@uh.cr','Guillermo', 'Gaitan', 7777, '1982-12-02')

select * from Client_Master

--UPDATE User_Master SET telefono = 6789 WHERE email = 'Carla@uh.cr'

create table User_Master(
email varchar(30) UNIQUE, --no se puede repetir
clave varchar(30),
tipo varchar(30),
CONSTRAINT PK2_email PRIMARY KEY (email),
CONSTRAINT FK_email FOREIGN KEY (email) REFERENCES Client_Master(email) )

INSERT INTO User_Master (email, clave, tipo) 
values ('Ana@UH.cr', '1111', 'Regular'),
	   ('Beli@uh.cr', '2222', 'Regular'),
	   ('Carla@uh.cr', '3333','Regular'),
		('Gaitan@uh.cr', '7777', 'Admin')

drop table Direccion

create table Direccion(
email varchar(30) UNIQUE, --no se puede repetir
provincia varchar(30),
canton varchar(30),
cod_distrito int,
distrito varchar(30),
detalles nvarchar(200),
CONSTRAINT PK_detalles PRIMARY KEY (detalles),
CONSTRAINT FK_email2 FOREIGN KEY (email) REFERENCES Client_Master(email),
CONSTRAINT FK_provincia2 FOREIGN KEY (provincia) REFERENCES Provincias(provincia),
CONSTRAINT FK_canton2 FOREIGN KEY (canton) REFERENCES Cantones(canton),
CONSTRAINT FK_Cod_distrito FOREIGN KEY (cod_distrito) REFERENCES Distritos(cod_distrito)
)

INSERT INTO Direccion (email, provincia, canton, cod_distrito, distrito, detalles) 
values ('Ana@uh.cr','San Jose','San Jose', 10101, 'Carmen', 'Frente a la Muni'),
		('Beli@uh.cr','Alajuela','Alajuela', 20101, 'Alajuela', 'Frente a la POPS'),
		('Carla@uh.cr','Cartago','Cartago', 30101, 'Oriental', 'Costado de la Basilica'),
		('Gaitan@uh.cr','Heredia','Heredia', 40103, 'San Francisco', 'Diagonal a la Iglesia')

-- Procedimientos almacenados
select FLOOR (rand(10)*(20-10+1))+1000;

create procedure consultaUsuarios
	as
		begin
			select * from User_Master
		end

		exec consultaUsuarios

create procedure borrarUsuarios
	@email varchar (30)
		as
		begin
			delete User_Master where email = @email
			
		end

		exec borrarUsuarios 'Dislexia0@uh.cr'


create procedure ingresarUsuarios --para modificar se cambia create por alter
	@cod_UC int,
	@email varchar (30),
	@clave varchar (30),
	@tipo varchar (30) = 'Regular'
	 as
	  begin
	   insert into User_Master (cod_UC, email, clave, tipo) values (@cod_UC, @email, @clave, @tipo)
	  end

	  execute ingresarUsuarios
	  exec consultaUsuarios

create procedure ingresarUsuarios --con clave automatica
	@cod_UC int,
	@email varchar (30),
	@tipo varchar (30) = 'Regular'
	 as
	  begin
	  declare @clave varchar (30) 
	  set @clave = (Select floor(rand()*1001))
	   insert into User_Master (cod_UC, email, clave, tipo) values (@cod_UC, @email, @clave, @tipo)
	  end

	  execute ingresarUsuarios
	  exec consultaUsuarios


create procedure actualizarUsuarios 
	@email varchar (30),
	@nombre varchar(50),
	@apellidos varchar(50),
	@telefono varchar(50),
	@fecha_nacimiento datetime,
	@clave varchar (30),
	@tipo varchar (30)
	 as
	  begin
	   update Client_Master (nombre, apellidos, telefono) set @email, 
	   update User_Master (cod_UC, email, clave, tipo) values (@cod_UC, @email, @clave, @tipo)
	  e
	   update User_Master (cod_UC, email, clave, tipo) values (@cod_UC, @email, @clave, @tipo)
	  end

	  execute ingresarUsuarios
	  exec consultaUsuarios

create procedure ConsultarUsuariosFiltro
@email varchar (30)
	as
		begin
		 select * from User_Master where email = @email
		end

		execute ConsultarUsuariosFiltro 'gaitan@uh.cr'

create procedure validarUsuario
	@email varchar (30),
	@clave varchar (30)
		as
			begin
				select * from User_Master where email = @email and clave = @clave
			end
execute validarUsuario 'Ana@uh.cr', '1111'

alter procedure mostrarCantones0
	@provincia varchar (30)
		as
			begin
				select canton from Cantones where provincia = @provincia
			end
execute mostrarCantones0 'Heredia'


create procedure mostrarDistritos0
	@canton varchar (30)
		as
			begin
				select distrito from Distritos where canton = @canton
			end
execute mostrarDistritos0 'Cartago'

create procedure mostrarDistritos1
	@canton varchar (30)
		as
			begin
				select cod_distrito from Distritos where canton = @canton
			end
execute mostrarDistritos1 'Cartago'


select canton from Cantones where provincia = 'Heredia'


create table Provincias(
provincia varchar(30),
CONSTRAINT PK_Provincia PRIMARY KEY (provincia)
)

INSERT INTO Provincias (provincia) 
values ('San Jose'),
		('Alajuela'),
		('Cartago'),
		('Heredia'),
		('Guanacaste'),
		('Puntarenas'),
		('Limon')

create table Cantones(
provincia varchar(30),
canton varchar(30),
CONSTRAINT PK_Canton PRIMARY KEY (canton),
CONSTRAINT FK_Provincia FOREIGN KEY (provincia) REFERENCES Provincias(provincia)
)

INSERT INTO Cantones (provincia, canton) 
values ('San Jose','San Jose'),
('San Jose','Escazu'),
('San Jose','Desamparados'),
('San Jose','Puriscal'),
('San Jose','Tarrazu'),
('San Jose','Aserri'),
('San Jose','Mora'),
('San Jose','Goicoechea'),
('San Jose','Santa Ana'),
('San Jose','Alajuelita'),
('San Jose','Vazquez de Coronado'),
('San Jose','Acosta'),
('San Jose','Tibas'),
('San Jose','Moravia'),
('San Jose','Montes de Oca'),
('San Jose','Turrubares'),
('San Jose','Dota'),
('San Jose','Curridabat'),
('San Jose','Perez Zeledon'),
('San Jose','Leon Cortes Castro'),
('Alajuela','Alajuela'),
('Alajuela','San Ramon'),
('Alajuela','Grecia'),
('Alajuela','San Mateo'),
('Alajuela','Atenas'),
('Alajuela','Naranjo'),
('Alajuela','Palmares'),
('Alajuela','Poas'),
('Alajuela','Orotina'),
('Alajuela','San Carlos'),
('Alajuela','Zarcero'),
('Alajuela','Sarchi'),
('Alajuela','Upala'),
('Alajuela','Los Chiles'),
('Alajuela','Guatuso'),
('Alajuela','Rio Cuarto'),
('Cartago','Cartago'),
('Cartago','Paraiso'),
('Cartago','La Union'),
('Cartago','Jimenez'),
('Cartago','Turrialba'),
('Cartago','Alvarado'),
('Cartago','Oreamuno'),
('Cartago','El Guarco'),
('Heredia','Heredia'),
('Heredia','Barva'),
('Heredia','Santo Domingo'),
('Heredia','Santa Barbara'),
('Heredia','San Rafael'),
('Heredia','San Isidro'),
('Heredia','Belen'),
('Heredia','Flores'),
('Heredia','San Pablo'),
('Heredia','Sarapiqui'),
('Guanacaste','Liberia'),
('Guanacaste','Nicoya'),
('Guanacaste','Santa Cruz'),
('Guanacaste','Bagaces'),
('Guanacaste','Carrillo'),
('Guanacaste','Cañas'),
('Guanacaste','Abangares'),
('Guanacaste','Tilaran'),
('Guanacaste','Nandayure'),
('Guanacaste','La Cruz'),
('Guanacaste','Hojancha'),
('Puntarenas','Puntarenas'),
('Puntarenas','Esparza'),
('Puntarenas','Buenos Aires'),
('Puntarenas','Montes de Oro'),
('Puntarenas','Osa'),
('Puntarenas','Quepos'),
('Puntarenas','Golfito'),
('Puntarenas','Coto Brus'),
('Puntarenas','Parrita'),
('Puntarenas','Corredores'),
('Puntarenas','Garabito'),
('Puntarenas','Monteverde'),
('Limon','Limon'),
('Limon','Pococi'),
('Limon','Siquirres'),
('Limon','Talamanca'),
('Limon','Matina'),
('Limon','Guacimo')




drop table Distritos

create table Distritos(
canton varchar(30),
cod_distrito int,
distrito varchar(30),
CONSTRAINT PK_cod_distrito PRIMARY KEY (cod_distrito),
CONSTRAINT FK_canton FOREIGN KEY (canton) REFERENCES Cantones(canton)
)

INSERT INTO Distritos (canton, cod_distrito, distrito)
values ('San Jose',10101,'Carmen'),
('San Jose',10102,'Merced'),
('San Jose',10103,'Hospital'),
('San Jose',10104,'Catedral'),
('San Jose',10105,'Zapote'),
('San Jose',10106,'San Francisco de Dos Rios'),
('San Jose',10107,'Uruca'),
('San Jose',10108,'Mata Redonda'),
('San Jose',10109,'Pavas'),
('San Jose',10110,'Hatillo'),
('San Jose',10111,'San Sebastian'),
('Escazu',10201,'Escazu'),
('Escazu',10202,'San Antonio'),
('Escazu',10203,'San Rafael'),
('Desamparados',10301,'Desamparados'),
('Desamparados',10302,'San Miguel'),
('Desamparados',10303,'San Juan de Dios'),
('Desamparados',10304,'San Rafael Arriba'),
('Desamparados',10305,'San Antonio'),
('Desamparados',10306,'Frailes'),
('Desamparados',10307,'Patarra'),
('Desamparados',10308,'San Cristobal'),
('Desamparados',10309,'Rosario'),
('Desamparados',10310,'Damas'),
('Desamparados',10311,'San Rafael Abajo'),
('Desamparados',10312,'Gravilias'),
('Desamparados',10313,'Los Guido'),
('Puriscal',10401,'Santiago'),
('Puriscal',10402,'Mercedes Sur'),
('Puriscal',10403,'Barbacoas'),
('Puriscal',10404,'Grifo Alto'),
('Puriscal',10405,'San Rafael'),
('Puriscal',10406,'Candelarita'),
('Puriscal',10407,'Desamparaditos'),
('Puriscal',10408,'San Antonio'),
('Puriscal',10409,'Chires'),
('Tarrazu',10501,'San Marcos'),
('Tarrazu',10502,'San Lorenzo'),
('Tarrazu',10503,'San Carlos'),
('Aserri',10601,'Aserri'),
('Aserri',10602,'Tarbaca'),
('Aserri',10603,'Vuelta de Jorco'),
('Aserri',10604,'San Gabriel'),
('Aserri',10605,'Legua'),
('Aserri',10606,'Monterrey'),
('Aserri',10607,'Salitrillos'),
('Mora',10701,'Colon'),
('Mora',10702,'Guayabo'),
('Mora',10703,'Tabarcia'),
('Mora',10704,'Piedras Negras'),
('Mora',10705,'Picagres'),
('Mora',10706,'Jaris'),
('Mora',10707,'Quitirrisi'),
('Goicoechea',10801,'Guadalupe'),
('Goicoechea',10802,'San Francisco'),
('Goicoechea',10803,'Calle Blancos'),
('Goicoechea',10804,'Mata de Platano'),
('Goicoechea',10805,'Ipis'),
('Goicoechea',10806,'Rancho Redondo'),
('Goicoechea',10807,'Purral'),
('Santa Ana',10901,'Santa Ana'),
('Santa Ana',10902,'Salitral'),
('Santa Ana',10903,'Pozos'),
('Santa Ana',10904,'Uruca'),
('Santa Ana',10905,'Piedades'),
('Santa Ana',10906,'Brasil'),
('Alajuelita',11001,'Alajuelita'),
('Alajuelita',11002,'San Josecito'),
('Alajuelita',11003,'San Antonio'),
('Alajuelita',11004,'Concepcion'),
('Alajuelita',11005,'San Felipe'),
('Vazquez de Coronado',11101,'San Isidro'),
('Vazquez de Coronado',11102,'San Rafael'),
('Vazquez de Coronado',11103,'Dulce Nombre de Jesus'),
('Vazquez de Coronado',11104,'Patalillo'),
('Vazquez de Coronado',11105,'Cascajal'),
('Acosta',11201,'San Ignacio'),
('Acosta',11202,'Guaitil'),
('Acosta',11203,'Palmichal'),
('Acosta',11204,'Cangrejal'),
('Acosta',11205,'Sabanillas'),
('Tibas',11301,'San Juan'),
('Tibas',11302,'Cinco Esquinas'),
('Tibas',11303,'Anselmo Llorente'),
('Tibas',11304,'Leon XIII'),
('Tibas',11305,'Colima'),
('Moravia',11401,'San Vicente'),
('Moravia',11402,'San Jeronimo'),
('Moravia',11403,'La Trinidad'),
('Montes de Oca',11501,'San Pedro'),
('Montes de Oca',11502,'Sabanilla'),
('Montes de Oca',11503,'Mercedes'),
('Montes de Oca',11504,'San Rafael'),
('Turrubares',11601,'San Pablo'),
('Turrubares',11602,'San Pedro'),
('Turrubares',11603,'San Juan de Mata'),
('Turrubares',11604,'San Luis'),
('Turrubares',11605,'Carara'),
('Dota',11701,'Santa Maria'),
('Dota',11702,'Jardin'),
('Dota',11703,'Copey'),
('Curridabat',11801,'Curridabat'),
('Curridabat',11802,'Granadilla'),
('Curridabat',11803,'Sanchez'),
('Curridabat',11804,'Tirrases'),
('Perez Zeledon',11901,'San Isidro de El General'),
('Perez Zeledon',11902,'El General'),
('Perez Zeledon',11903,'Daniel Flores'),
('Perez Zeledon',11904,'Rivas'),
('Perez Zeledon',11905,'San Pedro'),
('Perez Zeledon',11906,'Platanares'),
('Perez Zeledon',11907,'Pejibaye'),
('Perez Zeledon',11908,'Cajon'),
('Perez Zeledon',11909,'Baru'),
('Perez Zeledon',11910,'Rio Nuevo'),
('Perez Zeledon',11911,'Paramo'),
('Perez Zeledon',11912,'La  Amistad'),
('Leon Cortes Castro',12001,'San Pablo'),
('Leon Cortes Castro',12002,'San Andres'),
('Leon Cortes Castro',12003,'Llano Bonito'),
('Leon Cortes Castro',12004,'San Isidro'),
('Leon Cortes Castro',12005,'Santa Cruz'),
('Leon Cortes Castro',12006,'San Antonio'),
('Alajuela',20101,'Alajuela'),
('Alajuela',20102,'San Jose'),
('Alajuela',20103,'Carrizal'),
('Alajuela',20104,'San Antonio'),
('Alajuela',20105,'Guacima'),
('Alajuela',20106,'San Isidro'),
('Alajuela',20107,'Sabanilla'),
('Alajuela',20108,'San Rafael'),
('Alajuela',20109,'Rio Segundo'),
('Alajuela',20110,'Desamparados'),
('Alajuela',20111,'Turrucares'),
('Alajuela',20112,'Tambor'),
('Alajuela',20113,'Garita'),
('Alajuela',20114,'Sarapiqui'),
('San Ramon',20201,'San Ramon'),
('San Ramon',20202,'Santiago'),
('San Ramon',20203,'San Juan'),
('San Ramon',20204,'Piedades Norte'),
('San Ramon',20205,'Piedades Sur'),
('San Ramon',20206,'San Rafael'),
('San Ramon',20207,'San Isidro'),
('San Ramon',20208,'angeles'),
('San Ramon',20209,'Alfaro'),
('San Ramon',20210,'Volio'),
('San Ramon',20211,'Concepcion'),
('San Ramon',20212,'Zapotal'),
('San Ramon',20213,'Peñas Blancas'),
('San Ramon',20214,'San Lorenzo'),
('Grecia',20301,'Grecia'),
('Grecia',20302,'San Isidro'),
('Grecia',20303,'San Jose'),
('Grecia',20304,'San Roque'),
('Grecia',20305,'Tacares'),
('Grecia',20307,'Puente de Piedra'),
('Grecia',20308,'Bolivar'),
('San Mateo',20401,'San Mateo'),
('San Mateo',20402,'Desmonte'),
('San Mateo',20403,'Jesus Maria'),
('San Mateo',20404,'Labrador'),
('Atenas',20501,'Atenas'),
('Atenas',20502,'Jesus'),
('Atenas',20503,'Mercedes'),
('Atenas',20504,'San Isidro'),
('Atenas',20505,'Concepcion'),
('Atenas',20506,'San Jose'),
('Atenas',20507,'Santa Eulalia'),
('Atenas',20508,'Escobal'),
('Naranjo',20601,'Naranjo'),
('Naranjo',20602,'San Miguel'),
('Naranjo',20603,'San Jose'),
('Naranjo',20604,'Cirri Sur'),
('Naranjo',20605,'San Jeronimo'),
('Naranjo',20606,'San Juan'),
('Naranjo',20607,'El Rosario'),
('Naranjo',20608,'Palmitos'),
('Palmares',20701,'Palmares'),
('Palmares',20702,'Zaragoza'),
('Palmares',20703,'Buenos Aires'),
('Palmares',20704,'Santiago'),
('Palmares',20705,'Candelaria'),
('Palmares',20706,'Esquipulas'),
('Palmares',20707,'La Granja'),
('Poas',20801,'San Pedro'),
('Poas',20802,'San Juan'),
('Poas',20803,'San Rafael'),
('Poas',20804,'Carrillos'),
('Poas',20805,'Sabana Redonda'),
('Orotina',20901,'Orotina'),
('Orotina',20902,'El Mastate'),
('Orotina',20903,'Hacienda Vieja'),
('Orotina',20904,'Coyolar'),
('Orotina',20905,'La Ceiba'),
('San Carlos',21001,'Quesada'),
('San Carlos',21002,'Florencia'),
('San Carlos',21003,'Buenavista'),
('San Carlos',21004,'Aguas Zarcas'),
('San Carlos',21005,'Venecia'),
('San Carlos',21006,'Pital'),
('San Carlos',21007,'La Fortuna'),
('San Carlos',21008,'La Tigra'),
('San Carlos',21009,'La Palmera'),
('San Carlos',21010,'Venado'),
('San Carlos',21011,'Cutris'),
('San Carlos',21012,'Monterrey'),
('San Carlos',21013,'Pocosol'),
('Zarcero',21101,'Zarcero'),
('Zarcero',21102,'Laguna'),
('Zarcero',21103,'Tapesco'),
('Zarcero',21104,'Guadalupe'),
('Zarcero',21105,'Palmira'),
('Zarcero',21106,'Zapote'),
('Zarcero',21107,'Brisas'),
('Sarchi',21201,'Sarchi Norte'),
('Sarchi',21202,'Sarchi Sur'),
('Sarchi',21203,'Toro Amarillo'),
('Sarchi',21204,'San Pedro'),
('Sarchi',21205,'Rodriguez'),
('Upala',21301,'Upala'),
('Upala',21302,'Aguas Claras'),
('Upala',21303,'San Jose O Pizote'),
('Upala',21304,'Bijagua'),
('Upala',21305,'Delicias'),
('Upala',21306,'Dos Rios'),
('Upala',21307,'Yolillal'),
('Upala',21308,'Canalete'),
('Los Chiles',21401,'Los Chiles'),
('Los Chiles',21402,'Caño Negro'),
('Los Chiles',21403,'El Amparo'),
('Los Chiles',21404,'San Jorge'),
('Guatuso',21501,'San Rafael'),
('Guatuso',21502,'Buenavista'),
('Guatuso',21503,'Cote'),
('Guatuso',21504,'Katira'),
('Rio Cuarto',21601,'Rio Cuarto'),
('Rio Cuarto',21602,'Santa Rita'),
('Rio Cuarto',21603,'Santa Isabel'),
('Cartago',30101,'Oriental'),
('Cartago',30102,'Occidental'),
('Cartago',30103,'Carmen'),
('Cartago',30104,'San Nicolas'),
('Cartago',30105,'Aguacaliente o San Francisco'),
('Cartago',30106,'Guadalupe o Arenilla'),
('Cartago',30107,'Corralillo'),
('Cartago',30108,'Tierra Blanca'),
('Cartago',30109,'Dulce Nombre'),
('Cartago',30110,'Llano Grande'),
('Cartago',30111,'Quebradilla'),
('Paraiso',30201,'Paraiso'),
('Paraiso',30202,'Santiago'),
('Paraiso',30203,'Orosi'),
('Paraiso',30204,'Cachi'),
('Paraiso',30205,'Llanos de Santa Lucia'),
('Paraiso',30206,'Birrisito'),
('La Union',30301,'Tres Rios'),
('La Union',30302,'San Diego'),
('La Union',30303,'San Juan'),
('La Union',30304,'San Rafael'),
('La Union',30305,'Concepcion'),
('La Union',30306,'Dulce Nombre'),
('La Union',30307,'San Ramon'),
('La Union',30308,'Rio Azul'),
('Jimenez',30401,'Juan Viñas'),
('Jimenez',30402,'Tucurrique'),
('Jimenez',30403,'Pejibaye'),
('Turrialba',30501,'Turrialba'),
('Turrialba',30502,'La Suiza'),
('Turrialba',30503,'Peralta'),
('Turrialba',30504,'Santa Cruz'),
('Turrialba',30505,'Santa Teresita'),
('Turrialba',30506,'Pavones'),
('Turrialba',30507,'Tuis'),
('Turrialba',30508,'Tayutic'),
('Turrialba',30509,'Santa Rosa'),
('Turrialba',30510,'Tres Equis'),
('Turrialba',30511,'La Isabel'),
('Turrialba',30512,'Chirripo'),
('Alvarado',30601,'Pacayas'),
('Alvarado',30602,'Cervantes'),
('Alvarado',30603,'Capellades'),
('Oreamuno',30701,'San Rafael'),
('Oreamuno',30702,'Cot'),
('Oreamuno',30703,'Potrero Cerrado'),
('Oreamuno',30704,'Cipreses'),
('Oreamuno',30705,'Santa Rosa'),
('El Guarco',30801,'El Tejar'),
('El Guarco',30802,'San Isidro'),
('El Guarco',30803,'Tobosi'),
('El Guarco',30804,'Patio de Agua'),
('Heredia',40101,'Heredia'),
('Heredia',40102,'Mercedes'),
('Heredia',40103,'San Francisco'),
('Heredia',40104,'Ulloa'),
('Heredia',40105,'Varablanca'),
('Barva',40201,'Barva'),
('Barva',40202,'San Pedro'),
('Barva',40203,'San Pablo'),
('Barva',40204,'San Roque'),
('Barva',40205,'Santa Lucia'),
('Barva',40206,'San Jose de la Montaña'),
('Santo Domingo',40301,'Santo Domingo'),
('Santo Domingo',40302,'San Vicente'),
('Santo Domingo',40303,'San Miguel'),
('Santo Domingo',40304,'Paracito'),
('Santo Domingo',40305,'Santo Tomas'),
('Santo Domingo',40306,'Santa Rosa'),
('Santo Domingo',40307,'Tures'),
('Santo Domingo',40308,'Para'),
('Santa Barbara',40401,'Santa Barbara'),
('Santa Barbara',40402,'San Pedro'),
('Santa Barbara',40403,'San Juan'),
('Santa Barbara',40404,'Jesus'),
('Santa Barbara',40405,'Santo Domingo'),
('Santa Barbara',40406,'Puraba'),
('San Rafael',40501,'San Rafael'),
('San Rafael',40502,'San Josecito'),
('San Rafael',40503,'Santiago'),
('San Rafael',40504,'angeles'),
('San Rafael',40505,'Concepcion'),
('San Isidro',40601,'San Isidro'),
('San Isidro',40602,'San Jose'),
('San Isidro',40603,'Concepcion'),
('San Isidro',40604,'San Francisco'),
('Belen',40701,'San Antonio'),
('Belen',40702,'La Ribera'),
('Belen',40703,'La Asuncion'),
('Flores',40801,'San Joaquin'),
('Flores',40802,'Barrantes'),
('Flores',40803,'Llorente'),
('San Pablo',40901,'San Pablo'),
('San Pablo',40902,'Rincon de Sabanilla'),
('Sarapiqui',41001,'Puerto Viejo'),
('Sarapiqui',41002,'La Virgen'),
('Sarapiqui',41003,'Las Horquetas'),
('Sarapiqui',41004,'Llanuras del Gaspar'),
('Sarapiqui',41005,'Cureña'),
('Liberia',50101,'Liberia'),
('Liberia',50102,'Cañas Dulces'),
('Liberia',50103,'Mayorga'),
('Liberia',50104,'Nacascolo'),
('Liberia',50105,'Curubande'),
('Nicoya',50201,'Nicoya'),
('Nicoya',50202,'Mansion'),
('Nicoya',50203,'San Antonio'),
('Nicoya',50204,'Quebrada Honda'),
('Nicoya',50205,'Samara'),
('Nicoya',50206,'Nosara'),
('Nicoya',50207,'Belen de Nosarita'),
('Santa Cruz',50301,'Santa Cruz'),
('Santa Cruz',50302,'Bolson'),
('Santa Cruz',50303,'Veintisiete de Abril'),
('Santa Cruz',50304,'Tempate'),
('Santa Cruz',50305,'Cartagena'),
('Santa Cruz',50306,'Cuajiniquil'),
('Santa Cruz',50307,'Diria'),
('Santa Cruz',50308,'Cabo Velas'),
('Santa Cruz',50309,'Tamarindo'),
('Bagaces',50401,'Bagaces'),
('Bagaces',50402,'La Fortuna'),
('Bagaces',50403,'Mogote'),
('Bagaces',50404,'Rio Naranjo'),
('Carrillo',50501,'Filadelfia'),
('Carrillo',50502,'Palmira'),
('Carrillo',50503,'Sardinal'),
('Carrillo',50504,'Belen'),
('Cañas',50601,'Cañas'),
('Cañas',50602,'Palmira'),
('Cañas',50603,'San Miguel'),
('Cañas',50604,'Bebedero'),
('Cañas',50605,'Porozal'),
('Abangares',50701,'Las Juntas'),
('Abangares',50702,'Sierra'),
('Abangares',50703,'San Juan'),
('Abangares',50704,'Colorado'),
('Tilaran',50801,'Tilaran'),
('Tilaran',50802,'Quebrada Grande'),
('Tilaran',50803,'Tronadora'),
('Tilaran',50804,'Santa Rosa'),
('Tilaran',50805,'Libano'),
('Tilaran',50806,'Tierras Morenas'),
('Tilaran',50807,'Arenal'),
('Tilaran',50808,'Cabeceras'),
('Nandayure',50901,'Carmona'),
('Nandayure',50902,'Santa Rita'),
('Nandayure',50903,'Zapotal'),
('Nandayure',50904,'San Pablo'),
('Nandayure',50905,'Porvenir'),
('Nandayure',50906,'Bejuco'),
('La Cruz',51001,'La Cruz'),
('La Cruz',51002,'Santa Cecilia'),
('La Cruz',51003,'La Garita'),
('La Cruz',51004,'Santa Elena'),
('Hojancha',51101,'Hojancha'),
('Hojancha',51102,'Monte Romo'),
('Hojancha',51103,'Puerto Carrillo'),
('Hojancha',51104,'Huacas'),
('Hojancha',51105,'Matambu'),
('Puntarenas',60101,'Puntarenas'),
('Puntarenas',60102,'Pitahaya'),
('Puntarenas',60103,'Chomes'),
('Puntarenas',60104,'Lepanto'),
('Puntarenas',60105,'Paquera'),
('Puntarenas',60106,'Manzanillo'),
('Puntarenas',60107,'Guacimal'),
('Puntarenas',60108,'Barranca'),
('Puntarenas',60110,'Isla del Coco'),
('Puntarenas',60111,'Cobano'),
('Puntarenas',60112,'Chacarita'),
('Puntarenas',60113,'Chira'),
('Puntarenas',60114,'Acapulco'),
('Puntarenas',60115,'El Roble'),
('Puntarenas',60116,'Arancibia'),
('Esparza',60201,'Espiritu Santo'),
('Esparza',60202,'San Juan Grande'),
('Esparza',60203,'Macacona'),
('Esparza',60204,'San Rafael'),
('Esparza',60205,'San Jeronimo'),
('Esparza',60206,'Caldera'),
('Buenos Aires',60301,'Buenos Aires'),
('Buenos Aires',60302,'Volcan'),
('Buenos Aires',60303,'Potrero Grande'),
('Buenos Aires',60304,'Boruca'),
('Buenos Aires',60305,'Pilas'),
('Buenos Aires',60306,'Colinas'),
('Buenos Aires',60307,'Changuena'),
('Buenos Aires',60308,'Biolley'),
('Buenos Aires',60309,'Brunka'),
('Montes de Oro',60401,'Miramar'),
('Montes de Oro',60402,'La Union'),
('Montes de Oro',60403,'San Isidro'),
('Osa',60501,'Puerto Cortes'),
('Osa',60502,'Palmar'),
('Osa',60503,'Sierpe'),
('Osa',60504,'Bahia Ballena'),
('Osa',60505,'Piedras Blancas'),
('Osa',60506,'Bahia Drake'),
('Quepos',60601,'Quepos'),
('Quepos',60602,'Savegre'),
('Quepos',60603,'Naranjito'),
('Golfito',60701,'Golfito'),
('Golfito',60702,'Puerto Jimenez'),
('Golfito',60703,'Guaycara'),
('Golfito',60704,'Pavon'),
('Coto Brus',60801,'San Vito'),
('Coto Brus',60802,'Sabalito'),
('Coto Brus',60803,'Aguabuena'),
('Coto Brus',60804,'Limoncito'),
('Coto Brus',60805,'Pittier'),
('Coto Brus',60806,'Gutierrez Braun'),
('Parrita',60901,'Parrita'),
('Corredores',61001,'Corredor'),
('Corredores',61002,'La Cuesta'),
('Corredores',61003,'Canoas'),
('Corredores',61004,'Laurel'),
('Garabito',61101,'Jaco'),
('Garabito',61102,'Tarcoles'),
('Garabito',61103,'Lagunillas'),
('Monteverde',61201,'Monteverde'),
('Limon',70101,'Limon'),
('Limon',70102,'Valle La Estrella'),
('Limon',70103,'Rio Blanco'),
('Limon',70104,'Matama'),
('Pococi',70201,'Guapiles'),
('Pococi',70202,'Jimenez'),
('Pococi',70203,'Rita'),
('Pococi',70204,'Roxana'),
('Pococi',70205,'Cariari'),
('Pococi',70206,'Colorado'),
('Pococi',70207,'La Colonia'),
('Siquirres',70301,'Siquirres'),
('Siquirres',70302,'Pacuarito'),
('Siquirres',70303,'Florida'),
('Siquirres',70304,'Germania'),
('Siquirres',70305,'El Cairo'),
('Siquirres',70306,'Alegria'),
('Siquirres',70307,'Reventazon'),
('Talamanca',70401,'Bratsi'),
('Talamanca',70402,'Sixaola'),
('Talamanca',70403,'Cahuita'),
('Talamanca',70404,'Telire'),
('Matina',70501,'Matina'),
('Matina',70502,'Batan'),
('Matina',70503,'Carrandi'),
('Guacimo',70601,'Guacimo'),
('Guacimo',70602,'Mercedes'),
('Guacimo',70603,'Pocora'),
('Guacimo',70604,'Rio Jimenez'),
('Guacimo',70605,'Duacari')



SELECT cm.email, cm.nombre, cm.apellidos, cm.telefono, um.clave from Client_Master cm inner join User_Master um on um.email = cm.email WHERE um.email = 'gaitan@uh.cr'

SELECT cm.email, cm.nombre, cm.apellidos, cm.fecha_nacimiento, cm.telefono, um.clave, d.provincia, d.canton, d.distrito, d.detalles from Client_Master cm inner join User_Master um on um.email = cm.email inner join Direccion d on d.email = cm.email where cm.email = 'gaitan@uh.cr'


INSERT INTO Facturacion (email) VALUES ('Beli@UH.cr')

SELECT * FROM Distritos

SELECT um.email, um.clave, um.nombre, um.telefono, um.direccion, um.fecha_nacimiento, um.rutina, f.id_facturaPendiente, f.id_facturaPagada from User_Master um inner join Facturacion f on um.email = f.email WHERE um.email = 'Jafet@Herediano.com'

INSERT INTO User_Master (email, clave, nombre, telefono, direccion, fecha_nacimiento,rutina) 
values('Keysher@Gol.com', '7777', 'Keysher', 7777, 'Heredia', '1994-07-12', 'Avanzado')




CREATE TABLE Facturacion(
email varchar(30),
id_facturaPendiente int identity(1000,5), --consecutivo factura
id_facturaPagada int,
fecha_pago datetime DEFAULT GETDATE(),
CONSTRAINT PK_idfactura PRIMARY KEY (id_facturaPendiente),
CONSTRAINT FK_email FOREIGN KEY (email) REFERENCES User_Master(email)
)



