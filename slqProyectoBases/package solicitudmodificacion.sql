create or replace package pksolicitudmodificacion is
    procedure pCreatesolicitudmodificacion(solicitudcodigo in solicitudmodificacion.solicitudcodigo%type, productocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2);
    function fReadsolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, errorCod out number, errorName out varchar2) return solicitudmodificacion%rowtype;
    function fReadsolicitudmodificacionprodutocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2) return solicitudmodificacion%rowtype;
    procedure pUpdatesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2);
    procedure pUpdatesolicitudmodificacionproductocodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2);
    procedure pDeletesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, errorCod out number, errorName out varchar2);
    procedure pDeletesolicitudmodificacionproductocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2);
end pksolicitudmodificacion;

create or replace package body pksolicitudmodificacion is
    --procedure para añadir solicitudmodificacion
    procedure pCreatesolicitudmodificacion(solicitudcodigo in solicitudmodificacion.solicitudcodigo%type, productocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        insert into solicitudmodificacion values (solicitudcodigo, productocodigo);
        EXCEPTION
            when dup_val_on_index then
            errorCod := 1;
            errorName := 'solicitud modificacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pCreatesolicitudmodificacion;

    --function para leer solicitud modificacion por solicitud codigo
    function fReadsolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, errorCod out number, errorName out varchar2) return solicitudmodificacion%rowtype is
    rc solicitudmodificacion%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from solicitudmodificacion
        where solicitudmodificacion.solicitudcodigo = Esolicitudcodigo;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud modificacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadsolicitudmodificacionsolicitudcodigo;

    --function para leer solicitud modificacion por producto codigo
    function fReadsolicitudmodificacionprodutocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2) return solicitudmodificacion%rowtype is
    rc solicitudmodificacion%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from solicitudmodificacion
        where solicitudmodificacion.productocodigo = Eproductocodigo;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud modificacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadsolicitudmodificacionprodutocodigo;

    --procedure para actualizar solicitudmodificacion por solicitud codigo
    procedure pUpdatesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update solicitudmodificacion
        set productocodigo = Eproductocodigo
        where solicitudmodificacion.solicitudcodigo = Esolicitudcodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud modificacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdatesolicitudmodificacionsolicitudcodigo;

    --procedure para actualizar solicitudmodificacion por producto codigo
    procedure pUpdatesolicitudmodificacionproductocodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update solicitudmodificacion
        set solicitudcodigo = Esolicitudcodigo
        where solicitudmodificacion.productocodigo = Eproductocodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud modificacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdatesolicitudmodificacionproductocodigo;

    --procedure para borrar solicitud modificacion por solicitud codigo
    procedure pDeletesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from solicitudmodificacion
        where solicitudmodificacion.solicitudcodigo = Esolicitudcodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud modificacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeletesolicitudmodificacionsolicitudcodigo;

    --procedure para borrar solicitud modificacion por producto codigo
    procedure pDeletesolicitudmodificacionproductocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from solicitudmodificacion
        where solicitudmodificacion.productocodigo = Eproductocodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'solicitud modificacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeletesolicitudmodificacionproductocodigo;

end pksolicitudmodificacion;