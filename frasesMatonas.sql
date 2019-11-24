create database frases_matonas;
use frases_matonas;



create table persona (
	idPersona int not null auto_increment primary key,
    nombre varchar(50) not null,
    edad tinyint not null,
    carrera varchar(50) not null,
    fecha datetime not null default current_timestamp /*default current_timestamp inserta la fecha en automatico*/
    
);

create table frase(
	idFrase int not null auto_increment primary key,
    contenido varchar(500) not null,
    cantidad int not null,
    fechaDesde date not null,
    fecha datetime not null default current_timestamp
);

# Tabla asignaciones para mantener relaciones
create table  persona_frase(
	idPersonaFrase int not null  auto_increment primary key,
    idPersona int not null,
    idFrase int not null,
    fecha datetime not null default current_timestamp,
    foreign key(idPersona) references persona(idPersona),
    foreign key(idFrase) references frase(idFrase)
);





insert into persona (nombre,edad,carrera)
values('Jonas',26,'ISC');

insert into frase (contenido,cantidad,fechaDesde)
values ('ya amonos!',1,DATE '2019-11-21');

insert into persona_frase (idFrase,idPersona)
values (1,1);

select * from persona;

select frase.idFrase, frase.contenido, frase.cantidad, frase.fechaDesde, frase.fecha 
from frase  join  persona_frase  
on persona_frase.idFrase = frase.idFrase
where idPersona = 1;