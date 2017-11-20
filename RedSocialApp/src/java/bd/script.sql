/**
 * Author:  erubio
 * Created: 14-nov-2017
 */
drop database bd_RedSocial;

create database bd_RedSocial;

use bd_RedSocial;



create table sexo(
    id int auto_increment primary key,
    descripcion varchar(10)
);


create table usuario(
    id int auto_increment primary key,
    correo varchar(50),
    nombre varchar(20),
    apellido varchar(20),
    fecha_Nacimiento date,
    id_sexo int,
    pass varchar(50),
    imagen varchar(100),
    foreign key(id_sexo) references sexo(id)
);


create table post(
    id int auto_increment primary key,
    id_usuario int,
    post varchar(500),
    fecha datetime,
    foreign key(id_usuario) references usuario(id)
);


create table seguidor(
    id int auto_increment primary key,
    id_seguidor int,
    id_seguido int,
    foreign key(id_seguidor) references usuario(id),
    foreign key(id_seguido) references usuario(id)
);

insert into sexo values(null,'Masculino');
insert into sexo values(null,'Femenino');
insert into sexo values(null,'Otro');

insert into usuario values(null,'pato@gmail.com','Patricio','Gonzalez','1995-11-16','1','1234','nn');
insert into usuario values(null,'nicolas@gmail.com','Nicolas','Ahumada','2014-10-25','3','clave','nn');
insert into post values(null,1,'Mi primera publicacion en SocialApp',now());
insert into post values(null,1,'Mi segunda publicacion en SocialApp xD',now());

insert into seguidor values(null,1,2);

select * from sexo;
select * from usuario;
select * from post;
select * from seguidor;

select * from post where id_usuario = '1' order by fecha desc;

select * from usuario where nombre like '%go%' or apellido like '%go%' limit 1; 

SELECT * FROM post WHERE id_usuario = 1