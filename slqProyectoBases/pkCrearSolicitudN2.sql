create or replace package pkCrearSolicitudN2 is
    procedure pCrearSolicitudN2(codigo in varchar2, estado in varchar2, descripcion in varchar2, clienteCedula in varchar2, codigoProducto in varchar2, fechaCreacion in date, tipo in varchar2, nombre in varchar2, fechaNacimiento in date, direccion in varchar2, telefono in varchar2, descripcionProducto in varchar2, tipoProducto in varchar2, errorCodCliente out number, errorNameCliente out varchar2, errorCodProducto out number, errorNameProducto out varchar2, errorCodSolicitud out number, errorNameSolicitud out varchar2);
end pkCrearSolicitudN2;

create or replace package body pkCrearSolicitudN2 is
    
    procedure pCrearSolicitudN2(codigo in varchar2, estado in varchar2, descripcion in varchar2, clienteCedula in varchar2, codigoProducto in varchar2, fechaCreacion in date, tipo in varchar2, nombre in varchar2, fechaNacimiento in date, direccion in varchar2, telefono in varchar2, descripcionProducto in varchar2, tipoProducto in varchar2, errorCodCliente out number, errorNameCliente out varchar2, errorCodProducto out number, errorNameProducto out varchar2, errorCodSolicitud out number, errorNameSolicitud out varchar2) is
    begin
        errorCodCliente := 0;
        errorNameCliente := '';
		errorCodProducto := 0;
        errorNameProducto := '';
		errorCodSolicitud := 0;
        errorNameSolicitud := '';
        pkCliente.pCrearCliente(clienteCedula, nombre, fechaNacimiento, direccion, telefono, errorCodCliente, errorNameCliente);
        pkproducto.pcreateproducto(codigoProducto, descripcionProducto, tipoProducto, errorCodProducto, errorNameProducto);
        pksolicitud.pcreatesolicitud(codigo, estado, descripcion, clienteCedula, codigoProducto, fechaCreacion, tipo, errorCodSolicitud, errorNameSolicitud);
    end pCrearSolicitudN2;
    
end pkCrearSolicitudN2;