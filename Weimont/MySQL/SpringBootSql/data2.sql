-- PostgreSQL

create database users_management;


create table articulos
(
	idArticulo int(11) not null
		constraint users_table_pk
			primary key,
	descArticulo varchar(100),
	precioUnit float,
	cantExis int(11)
);


insert into articulos(idArticulo ,descArticulo ,precioUnit , cantExis) 
values('1','Lapicero','3','50');



