create table opciones
(
    id_opcion      int auto_increment
        primary key,
    nombre_opcion  varchar(200) not null,
    url            varchar(200) not null,
    id_usuario_reg int          not null,
    fecha_reg      datetime     not null,
    ipmaq_reg      varchar(20)  not null,
    id_usuario_act int          null,
    fecha_act      datetime     null,
    ipmaq_act      varchar(20)  null,
    id_usuario_del int          null,
    fecha_del      datetime     null,
    ipmaq_del      varchar(20)  null
);

create table perfil_opciones
(
    id_perfil_opcion int auto_increment
        primary key,
    id_perfil        int         not null,
    id_opcion        int         not null,
    id_usuario_reg   int         not null,
    fecha_reg        datetime    not null,
    ipmaq_reg        varchar(20) not null,
    id_usuario_act   int         null,
    fecha_act        datetime    null,
    ipmaq_act        varchar(20) null,
    id_usuario_del   int         null,
    fecha_del        datetime    null,
    ipmaq_del        varchar(20) null
);

create table perfiles
(
    id_perfil      int auto_increment
        primary key,
    nombre_perfil  varchar(50) not null,
    descripcion    varchar(50) not null,
    estado         tinyint(1)  not null,
    id_usuario_reg int         not null,
    fecha_reg      datetime    not null,
    ipmaq_reg      varchar(20) null,
    id_usuario_act int         null,
    fecha_act      datetime    null,
    ipmaq_act      varchar(20) null,
    id_usuario_del int         null,
    fecha_del      datetime    null,
    ipmaq_del      varchar(20) null
);

create table personas
(
    id_persona       int auto_increment
        primary key,
    dni              varchar(8)   not null,
    nombres          varchar(50)  not null,
    apellido_paterno varchar(200) not null,
    apellido_materno varchar(200) not null,
    sexo             varchar(20)  not null,
    id_usuario_reg   int          not null,
    fecha_reg        datetime     not null,
    ipmaq_reg        varchar(20)  not null,
    id_usuario_act   int          null,
    fecha_act        datetime     null,
    ipmaq_act        varchar(20)  null,
    id_usuario_del   int          null,
    fecha_del        datetime     null,
    ipmaq_del        varchar(20)  null
);

create table usuarios
(
    id_usuario     int auto_increment
        primary key,
    id_persona     int                  not null,
    id_area        int                  not null,
    id_perfil      int                  not null,
    usuario        varchar(100)         not null,
    password       varchar(200)         not null,
    correo         varchar(100)         null,
    id_usuario_reg int                  not null,
    fecha_reg      datetime             not null,
    ipmaq_reg      varchar(20)          not null,
    id_usuario_act int                  null,
    fecha_act      datetime             null,
    ipmaq_act      varchar(20)          null,
    id_usuario_del int                  null,
    fecha_del      datetime             null,
    ipmaq_del      varchar(20)          null,
    estado         tinyint(1) default 1 not null
);

create
    definer = root@localhost procedure datoUsuario(IN idUsuario int)
begin
	select
		pe.nombre_perfil as perfil,
		concat(p.nombres,' ',p.apellido_paterno,' ',p.apellido_materno) as persona
	from usuarios u
		inner join personas p on u.id_persona = p.id_persona
		inner join perfiles pe on u.id_perfil = pe.id_perfil
  where u.fecha_del is null and u.id_usuario = idUsuario;
end;

create
    definer = root@localhost procedure listadoModulo(IN row1 int, IN length1 int, IN buscar varchar(200))
BEGIN
   SELECT
			id_opcion as id_modulo,
			nombre_opcion as nombre_modulo,
			url as ruta,
			(select count(*) from opciones where fecha_del is null) as total
		FROM opciones where fecha_del is null and nombre_opcion like concat('%',buscar,'%')
		LIMIT row1,length1;
END;

create
    definer = root@localhost procedure listadoPerfil(IN row1 int, IN length1 int, IN busca varchar(200))
BEGIN
   SELECT
			id_perfil,
			nombre_perfil,
			descripcion,
			estado,
			(select count(*) from perfiles where fecha_del is null) as total
		FROM perfiles where fecha_del is null and nombre_perfil like concat('%',busca,'%')
		LIMIT row1,length1;
END;

create
    definer = root@localhost procedure listadoPersona(IN row1 int, IN length1 int, IN busca varchar(200))
BEGIN
	select
		id_persona,
		dni,
		nombres,
		apellido_paterno,
		apellido_materno,
		(select count(*) from personas where fecha_del is null) as total
	from personas
  where fecha_del is null and concat(nombres,' ',apellido_paterno,' ',apellido_materno) like concat('%',busca,'%')
		LIMIT row1,length1;
END;

create
    definer = root@localhost procedure listadoUsuario(IN row1 int, IN length1 int, IN busca varchar(200))
BEGIN
	select
		u.id_usuario,
		u.usuario,
		pe.nombre_perfil as perfil,
		concat(p.nombres,' ',p.apellido_paterno,' ',p.apellido_materno) as persona,
		(select count(*) from usuarios where fecha_del is null) as total
	from usuarios u
		inner join personas p on u.id_persona = p.id_persona
		inner join perfiles pe on u.id_perfil = pe.id_perfil
  where u.fecha_del is null and concat(u.id_usuario,' ',u.usuario,' ',pe.nombre_perfil,' ',p.nombres,' ',p.apellido_paterno,' ',p.apellido_materno) like concat('%',busca,'%')
		LIMIT row1,length1;
END;

create
    definer = root@localhost procedure menu(IN idPerfil int)
begin
select
	o.nombre_opcion,
	o.url
from perfil_opciones po
inner join opciones o on po.id_opcion = o.id_opcion and po.fecha_del is null
where po.id_perfil = idPerfil;
end;

create
    definer = root@localhost procedure prefilOpciones(IN idPerfil int)
begin
select
o.id_opcion,
o.nombre_opcion,
(case when po.id_perfil_opcion > 0 then 1 else 0 end) as activo
from perfil_opciones po
right join opciones o on po.id_opcion = o.id_opcion and po.fecha_del is null and po.id_perfil = idPerfil;
end;

