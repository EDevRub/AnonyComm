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
    nombre_Usuario varchar(20),
    correo varchar(50),
    nombre varchar(20),
    apellido varchar(20),
    fecha_Nacimiento date,
    id_sexo int,
    pass varchar(50),
    foreign key(id_sexo) references sexo(id)
);


create table post(
    id int auto_increment primary key,
    id_usuario int,
    post varchar(500),
    fecha date,
    foreign key(id_usuario) references usuario(id)
);


create table seguidor(
    id int auto_increment primary key,
    id_seguidor int,
    id_seguido int,
    foreign key(id_seguidor) references usuario(id),
    foreign key(id_seguido) references usuario(id)
);