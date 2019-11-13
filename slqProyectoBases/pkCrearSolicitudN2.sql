create or replace package body pkCrearSolicitudN2 is
    
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

end pkCrearSolicitudN2;