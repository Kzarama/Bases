/*
package de nivel 2 con las funciones para crear solicitud retornar estado solicitud, retornar tipo solicitud y retornar tipo producto
*/
create or replace package pkCrearSolicitudN2 is
    procedure pCrearSolicitudN2(codigo in varchar2, estado in varchar2, descripcion in varchar2, clienteCedula in varchar2, codigoProducto in varchar2, fechaCreacion in date, tipo in varchar2, nombre in varchar2, fechaNacimiento in date, direccion in varchar2, telefono in varchar2, descripcionProducto in varchar2, tipoProducto in varchar2, errorCodCliente out number, errorNameCliente out varchar2, errorCodProducto out number, errorNameProducto out varchar2, errorCodSolicitud out number, errorNameSolicitud out varchar2);
    function pRetornarEstadoSol return SYS_REFCURSOR;
    function pRetornarTipoSol return SYS_REFCURSOR;
    function pRetornarTipoProducto return SYS_REFCURSOR;
end pkCrearSolicitudN2;
/
/*
package body de nivel 2 con las funciones para crear solicitud retornar estado solicitud, retornar tipo solicitud y retornar tipo producto
*/
create or replace package body pkCrearSolicitudN2 is
	/*
	procedure para añadir solicitud
	*/
    procedure pCrearSolicitudN2(codigo in varchar2, estado in varchar2, descripcion in varchar2, clienteCedula in varchar2, codigoProducto in varchar2, fechaCreacion in date, tipo in varchar2, nombre in varchar2, fechaNacimiento in date, direccion in varchar2, telefono in varchar2, descripcionProducto in varchar2, tipoProducto in varchar2, errorCodCliente out number, errorNameCliente out varchar2, errorCodProducto out number, errorNameProducto out varchar2, errorCodSolicitud out number, errorNameSolicitud out varchar2) is
    begin
        errorCodCliente := 0;
        errorNameCliente := '';
		errorCodProducto := 0;
        errorNameProducto := '';
		errorCodSolicitud := 0;
        errorNameSolicitud := '';
        if nombre <> '0' then 
            pkCliente.pCrearCliente(clienteCedula, nombre, fechaNacimiento, direccion, telefono, errorCodCliente, errorNameCliente);
        end if;
        if descripcionProducto <> '0' then 
            pkproducto.pcreateproducto(codigoProducto, descripcionProducto, tipoProducto, errorCodProducto, errorNameProducto);
        end if;
        pksolicitud.pcreatesolicitud(codigo, estado, descripcion, clienteCedula, codigoProducto, fechaCreacion, tipo, errorCodSolicitud, errorNameSolicitud);

    end pCrearSolicitudN2;
	/*
	function que retorna los estados de solicitud
	*/
    function pRetornarEstadoSol return SYS_REFCURSOR is
    type ref_cursor is ref cursor;
    cuEstadoSolicitud ref_cursor;
    begin open cuEstadoSolicitud for select distinct estado from solicitud;
    return cuEstadoSolicitud;
    end;
	/*
	function que retorna los tipos de solicitud
	*/
    function pRetornarTipoSol return SYS_REFCURSOR is
    type ref_cursor is ref cursor;
    cuTipoSol ref_cursor;
    begin open cuTipoSol for select distinct tipo from solicitud;
    return cuTipoSol;
    end;
	/*
	function que retorna los tipos de producto
	*/
    function pRetornarTipoProducto return SYS_REFCURSOR is
    type ref_cursor is ref cursor;
    cuTipoProducto ref_cursor;
    begin open cuTipoProducto for select distinct tipo from producto;
    return cuTipoProducto;
    end;

end pkCrearSolicitudN2;
/