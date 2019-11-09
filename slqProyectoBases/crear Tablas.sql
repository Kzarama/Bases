drop table anomalia cascade constraints;
drop table asignacion cascade constraints;
drop table cliente cascade constraints;
drop table funcionario cascade constraints;
drop table producto cascade constraints;
drop table servicio cascade constraints;
drop table solicitud cascade constraints;
drop table solicitudmodificacion cascade constraints;
drop table solicitudreportedanio cascade constraints;

CREATE TABLE anomalia (
    id            VARCHAR2(20 CHAR) NOT NULL,
    descripcion   VARCHAR2(20 CHAR)
);

ALTER TABLE anomalia ADD CONSTRAINT anomalia_pk PRIMARY KEY ( id );

CREATE TABLE asignacion (
    fechaasignacion         DATE,
    fechaatencion           DATE,
    funcionariocedula       VARCHAR2(20) NOT NULL,
    solicitudcodigo         VARCHAR2(20) NOT NULL,
    funcionariocomentario   DATE,
    atendido                NUMBER
);

ALTER TABLE asignacion ADD CONSTRAINT asignacion_pk PRIMARY KEY ( funcionariocedula, solicitudcodigo );

CREATE TABLE cliente (
    cedula            VARCHAR2(20 CHAR) NOT NULL,
    nombre            VARCHAR2(100 CHAR),
    fechanacimiento   DATE,
    direccion         VARCHAR2(20 CHAR),
    telefono          VARCHAR2(20 CHAR)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cedula );

CREATE TABLE funcionario (
    cedula            VARCHAR2(20) NOT NULL,
    nombre            VARCHAR2(20 CHAR),
    fechanacimiento   DATE,
    direccion         VARCHAR2(20 CHAR),
    telefono          VARCHAR2(20 CHAR)
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( cedula );

CREATE TABLE producto (
    codigo        VARCHAR2(20 CHAR) NOT NULL,
    descripcion   VARCHAR2(200 CHAR),
    tipo          VARCHAR2(20 CHAR)
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( codigo );

CREATE TABLE servicio (
    productocodigo     VARCHAR2(20 CHAR) NOT NULL,
    clientecedula      VARCHAR2(20 CHAR) NOT NULL,
    fechainicio        DATE,
    fechaterminacion   DATE
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( productocodigo, clientecedula );

CREATE TABLE solicitud (
    codigo           VARCHAR2(20 char) NOT NULL,
    estado           VARCHAR2(20 char),
    descripcion      VARCHAR2(4000 char),
    clientecedula    VARCHAR2(20 char) NOT NULL,
    productocodigo   VARCHAR2(20 char) NOT NULL,
    fechacreacion    DATE,
    tipo             VARCHAR2(20 char)
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( codigo );

CREATE TABLE solicitudmodificacion (
    solicitudcodigo   VARCHAR2(20) NOT NULL,
    productocodigo    VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE solicitudmodificacion ADD CONSTRAINT solicitudmodi_pk PRIMARY KEY ( solicitudcodigo );

CREATE TABLE solicitudreportedanio (
    solicitudcodigo   VARCHAR2(20) NOT NULL,
    anomaliaid        VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE solicitudreportedanio ADD CONSTRAINT solicitudreportedanio_pk PRIMARY KEY ( solicitudcodigo );

ALTER TABLE asignacion
    ADD CONSTRAINT asignacionfuncionario_fk FOREIGN KEY ( funcionariocedula )
        REFERENCES funcionario ( cedula );

ALTER TABLE asignacion
    ADD CONSTRAINT asignacionsolicitud_fk FOREIGN KEY ( solicitudcodigo )
        REFERENCES solicitud ( codigo );

ALTER TABLE servicio
    ADD CONSTRAINT serviciocliente_fk FOREIGN KEY ( clientecedula )
        REFERENCES cliente ( cedula );

ALTER TABLE servicio
    ADD CONSTRAINT servicioproducto_fk FOREIGN KEY ( productocodigo )
        REFERENCES producto ( codigo );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitudcliente_fk FOREIGN KEY ( clientecedula )
        REFERENCES cliente ( cedula );

ALTER TABLE solicitudmodificacion
    ADD CONSTRAINT solicitudmodificacion_producto_fk FOREIGN KEY ( productocodigo )
        REFERENCES producto ( codigo );

ALTER TABLE solicitudmodificacion
    ADD CONSTRAINT solicitudmodificacion_solicitud_fk FOREIGN KEY ( solicitudcodigo )
        REFERENCES solicitud ( codigo );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitudproducto_fk FOREIGN KEY ( productocodigo )
        REFERENCES producto ( codigo );

ALTER TABLE solicitudreportedanio
    ADD CONSTRAINT solicitudreportedanio_fk FOREIGN KEY ( solicitudcodigo )
        REFERENCES solicitud ( codigo );

ALTER TABLE solicitudreportedanio
    ADD CONSTRAINT solicitudreportedanomalia_fk FOREIGN KEY ( anomaliaid )
        REFERENCES anomalia ( id );