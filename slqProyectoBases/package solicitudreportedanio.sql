/*
package CRUD de solicitud reporte danio
*/
create or replace package pksolicitudreportedanio is
    procedure pCreatesolicitudreportedanio(solicitudcodigo in solicitudreportedanio.solicitudcodigo%type, anomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2);
    function fReadsolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, errorCod out number, errorName out varchar2) return solicitudreportedanio%rowtype;
    function fReadsolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2) return solicitudreportedanio%rowtype;
    procedure pUpdatesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2);
    procedure pUpdatesolicitudreportedanioanomaliaid(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2);
    procedure pDeletesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, errorCod out number, errorName out varchar2);
    procedure pDeletesolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2);
end pksolicitudreportedanio;
/
/*
package body CRUD de solicitud reporte danio
*/
create or replace package body pksolicitudreportedanio is
    /*
	procedure para añadir solicitudreportedanio
	*/
    procedure pCreatesolicitudreportedanio(solicitudcodigo in solicitudreportedanio.solicitudcodigo%type, anomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        insert into solicitudreportedanio values (solicitudcodigo, anomaliaid);
        EXCEPTION
            when dup_val_on_index then
            errorCod := 1;
            errorName := 'solicitud reporte danio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pCreatesolicitudreportedanio;
	/*
    function para leer solicitud reporte danio por solicitud codigo
	*/
    function fReadsolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, errorCod out number, errorName out varchar2) return solicitudreportedanio%rowtype is
    rc solicitudreportedanio%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from solicitudreportedanio
        where solicitudreportedanio.solicitudcodigo = Esolicitudcodigo;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud reporte danio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadsolicitudreportedaniosolicitudcodigo;
	/*
    function para leer solicitud reporte danio anomalia id
	*/
    function fReadsolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2) return solicitudreportedanio%rowtype is
    rc solicitudreportedanio%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from solicitudreportedanio
        where solicitudreportedanio.anomaliaid = Eanomaliaid;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud reporte danio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadsolicitudreportedanioanomaliaid;
	/*
    procedure para actualizar solicitudreportedanio por solicitud codigo
	*/
    procedure pUpdatesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update solicitudreportedanio
        set solicitudcodigo = Esolicitudcodigo
        where solicitudreportedanio.anomaliaid = Eanomaliaid;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud reporte danio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdatesolicitudreportedaniosolicitudcodigo;
	/*
    procedure para actualizar solicitudreportedanio por anomalia id
	*/
    procedure pUpdatesolicitudreportedanioanomaliaid(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update solicitudreportedanio
        set anomaliaid = Eanomaliaid
        where solicitudreportedanio.solicitudcodigo = Esolicitudcodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud reporte danio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdatesolicitudreportedanioanomaliaid;
	/*
    procedure para borrar solicitud reporte danio por solicitud codigo
    */
	procedure pDeletesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from solicitudreportedanio
        where solicitudreportedanio.solicitudcodigo = Esolicitudcodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud reporte danio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeletesolicitudreportedaniosolicitudcodigo;
	/*
    procedure para borrar solicitud reporte danio por anomalia id
	*/
    procedure pDeletesolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from solicitudreportedanio
        where solicitudreportedanio.anomaliaid = Eanomaliaid;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud reporte danio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeletesolicitudreportedanioanomaliaid;

end pksolicitudreportedanio;
/