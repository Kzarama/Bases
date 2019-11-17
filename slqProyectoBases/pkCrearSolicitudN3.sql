/*
package de nivel 3 con las funciones para crear solicitud retornar estado solicitud, retornar tipo solicitud y retornar tipo producto
*/
create or replace package pkCrearSolicitudN3 is
    procedure pCrearSolicitudN3(codigo in varchar2, estado in varchar2, descripcion in varchar2, clienteCedula in varchar2, codigoProducto in varchar2, fechaCreacion in date, tipo in varchar2, nombre in varchar2, fechaNacimiento in date, direccion in varchar2, telefono in varchar2, descripcionProducto in varchar2, tipoProducto in varchar2, errorCodCliente out number, errorNameCliente out varchar2, errorCodProducto out number, errorNameProducto out varchar2, errorCodSolicitud out number, errorNameSolicitud out varchar2);
    function pRetornarEstadoSol return sys_refcursor;
    function pRetornarTipoSol return sys_refcursor;
    function pRetornarTipoProducto return sys_refcursor;
end pkCrearSolicitudN3;
/
/*
package de nivel 3 con las funciones para crear solicitud retornar estado solicitud, retornar tipo solicitud y retornar tipo producto
*/
create or replace package body pkCrearSolicitudN3 is
	/*
	procedure para añadir solicitud
	*/
    procedure pCrearSolicitudN3(codigo in varchar2, estado in varchar2, descripcion in varchar2, clienteCedula in varchar2, codigoProducto in varchar2, fechaCreacion in date, tipo in varchar2, nombre in varchar2, fechaNacimiento in date, direccion in varchar2, telefono in varchar2, descripcionProducto in varchar2, tipoProducto in varchar2, errorCodCliente out number, errorNameCliente out varchar2, errorCodProducto out number, errorNameProducto out varchar2, errorCodSolicitud out number, errorNameSolicitud out varchar2) is
    begin
        errorCodCliente := 0;
        errorNameCliente := '';
		errorCodProducto := 0;
        errorNameProducto := '';
		errorCodSolicitud := 0;
        errorNameSolicitud := '';
        pkcrearsolicitudn2.pcrearsolicitudn2(codigo, estado, descripcion, clienteCedula, codigoProducto, fechaCreacion, tipo, nombre, fechaNacimiento, direccion, telefono, descripcionProducto, tipoProducto, errorCodCliente, errorNameCliente, errorCodProducto, errorNameProducto, errorCodSolicitud, errorNameSolicitud);
    end pCrearSolicitudN3;
	/*
	function que retorna los estados de solicitud
	*/
    function pRetornarEstadoSol return sys_refcursor is
        type ref_cursor is ref cursor;
        cunombre ref_cursor;
    begin
        cunombre := (pkCrearSolicitudN2.pRetornarEstadoSol);
        return cunombre;
    end;
	/*
	function que retorna los tipos de solicitud
	*/
    function pRetornarTipoSol return sys_refcursor is
        type ref_cursor is ref cursor;
        cunombre ref_cursor;
    begin
        cunombre := (pkCrearSolicitudN2.pRetornarTipoSol);
        return cunombre;
    end;
	/*
	function que retorna los tipos de producto
	*/
    function pRetornarTipoProducto return sys_refcursor is
        type ref_cursor is ref cursor;
        cunombre ref_cursor;
    begin
        cunombre := (pkCrearSolicitudN2.pRetornarTipoProducto);
        return cunombre;
    end;

end pkCrearSolicitudN3;
/