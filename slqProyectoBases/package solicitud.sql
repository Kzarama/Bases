/*
package CRUD de solicitud
*/
create or replace package pksolicitud is
    procedure pCreatesolicitud(codigo in solicitud.codigo%type, estado in solicitud.estado%type, descripcion in solicitud.descripcion%type, clientecedula in solicitud.clientecedula%type, productocodigo in solicitud.productocodigo%type, fechacreacion in solicitud.fechacreacion%type, tipo in solicitud.tipo%type, errorCod out number, errorName out varchar2);
    function fReadsolicitudcodigo(Ecodigo in solicitud.codigo%type, errorCod out number, errorName out varchar2) return solicitud%rowtype;
    function fReadsolicitudclientecedula(Eclientecedula in solicitud.clientecedula%type, errorCod out number, errorName out varchar2) return solicitud%rowtype;
    function fReadsolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type, errorCod out number, errorName out varchar2) return solicitud%rowtype;
    procedure pUpdatesolicitudcodigo(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type, errorCod out number, errorName out varchar2);
    procedure pUpdatesolicitudclientecedula(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type, errorCod out number, errorName out varchar2);
    procedure pUpdatesolicitudcodigoproducto(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type, errorCod out number, errorName out varchar2);
    procedure pDeletesolicitudcodigo(Ecodigo in solicitud.codigo%type, errorCod out number, errorName out varchar2);
    procedure pDeletesolicitudClientecedula(Eclientecedula in solicitud.clientecedula%type, errorCod out number, errorName out varchar2);
    procedure pDeletesolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type, errorCod out number, errorName out varchar2);
end pksolicitud;
/*
package body CRUD de solicitud
*/
create or replace package body pksolicitud is
    /*
	procedure para añadir solicitud
	*/
    procedure pCreatesolicitud(codigo in solicitud.codigo%type, estado in solicitud.estado%type, descripcion in solicitud.descripcion%type, clientecedula in solicitud.clientecedula%type, productocodigo in solicitud.productocodigo%type, fechacreacion in solicitud.fechacreacion%type, tipo in solicitud.tipo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        insert into solicitud values (codigo, estado, descripcion, clientecedula, productocodigo, fechacreacion, tipo);
        EXCEPTION
            when dup_val_on_index then
            errorCod := 1;
            errorName := 'solicitud';
            when no_data_found then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pCreatesolicitud;
	/*
    function para leer solicitud por codigo
	*/
    function fReadsolicitudcodigo(Ecodigo in solicitud.codigo%type, errorCod out number, errorName out varchar2) return solicitud%rowtype is
    rc solicitud%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from solicitud
        where solicitud.codigo = Ecodigo;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadsolicitudcodigo;
	/*
    function para leer solicitud por cedula cliente
	*/
    function fReadsolicitudclientecedula(Eclientecedula in solicitud.clientecedula%type, errorCod out number, errorName out varchar2) return solicitud%rowtype is
    rc solicitud%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from solicitud
        where solicitud.clientecedula = Eclientecedula;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadsolicitudclientecedula;
	/*
    function para leer solicitud por producto codigo
	*/
    function fReadsolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type, errorCod out number, errorName out varchar2) return solicitud%rowtype is
    rc solicitud%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from solicitud
        where solicitud.productocodigo = Eproductocodigo;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadsolicitudproductocodigo;
	/*
    procedure para actualizar solicitud
	*/
    procedure pUpdatesolicitudcodigo(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update solicitud
        set estado = Eestado, descripcion = Edescripcion, clientecedula = Eclientecedula, productocodigo = Eproductocodigo, fechacreacion = Efechacreacion, tipo = Etipo
        where solicitud.codigo = Ecodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdatesolicitudcodigo;
	/*
    procedure para actualizar solicitud por cedula cliente
	*/
    procedure pUpdatesolicitudclientecedula(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update solicitud
        set estado = Eestado, descripcion = Edescripcion, codigo = Ecodigo, productocodigo = Eproductocodigo, fechacreacion = Efechacreacion, tipo = Etipo
        where solicitud.clientecedula = Eclientecedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdatesolicitudclientecedula;
	/*
    procedure para actualizar solicitud por codigo producto
	*/
    procedure pUpdatesolicitudcodigoproducto(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update solicitud
        set estado = Eestado, descripcion = Edescripcion, clientecedula = Eclientecedula, codigo = Ecodigo, fechacreacion = Efechacreacion, tipo = Etipo
        where solicitud.productocodigo = Eproductocodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdatesolicitudcodigoproducto;
	/*
    procedure para borrar solicitud por codigo
	*/
    procedure pDeletesolicitudcodigo(Ecodigo in solicitud.codigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from solicitud
        where solicitud.codigo = Ecodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeletesolicitudcodigo;
	/*
    procedure para borrar solicitud por cedula cliente
	*/
    procedure pDeletesolicitudClientecedula(Eclientecedula in solicitud.clientecedula%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from solicitud
        where solicitud.clientecedula = Eclientecedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeletesolicitudClientecedula;
	/*
    procedure para borrar solicitud por codigo producto
	*/
    procedure pDeletesolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from solicitud
        where solicitud.productocodigo = Eproductocodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeletesolicitudproductocodigo;

end pksolicitud;