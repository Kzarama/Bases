--package of solicitudmodificacion
create or replace package pksolicitudmodificacion is
    procedure pCreatesolicitudmodificacion(solicitudcodigo in solicitudmodificacion.solicitudcodigo%type, productocodigo in solicitudmodificacion.productocodigo%type);
    function fReadsolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type) return solicitudmodificacion%rowtype;
    function fReadsolicitudmodificacionprodutocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type) return solicitudmodificacion%rowtype;
    procedure pUpdatesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type);
    procedure pUpdatesolicitudmodificacionproductocodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type);
    procedure pDeletesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type);
    procedure pDeletesolicitudmodificacionproductocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type);
end pksolicitudmodificacion;

create or replace package body pksolicitudmodificacion is
    --procedure para añadir solicitudmodificacion
    procedure pCreatesolicitudmodificacion(solicitudcodigo in solicitudmodificacion.solicitudcodigo%type, productocodigo in solicitudmodificacion.productocodigo%type) is
    begin
        insert into solicitudmodificacion values (solicitudcodigo, productocodigo);
    end pCreatesolicitudmodificacion;
    
    --function para leer solicitud modificacion por solicitud codigo
    function fReadsolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type) return solicitudmodificacion%rowtype is
    rc solicitudmodificacion%rowtype;
    begin
        select * into rc
        from solicitudmodificacion
        where solicitudmodificacion.solicitudcodigo = Esolicitudcodigo;
        return rc;
    end fReadsolicitudmodificacionsolicitudcodigo;
    
    --function para leer solicitud modificacion por producto codigo
    function fReadsolicitudmodificacionprodutocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type) return solicitudmodificacion%rowtype is
    rc solicitudmodificacion%rowtype;
    begin
        select * into rc
        from solicitudmodificacion
        where solicitudmodificacion.productocodigo = Eproductocodigo;
        return rc;
    end fReadsolicitudmodificacionprodutocodigo;
    
    --procedure para actualizar solicitudmodificacion por solicitud codigo
    procedure pUpdatesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type) is
    begin
        update solicitudmodificacion
        set productocodigo = Eproductocodigo
        where solicitudmodificacion.solicitudcodigo = Esolicitudcodigo;
    end pUpdatesolicitudmodificacionsolicitudcodigo;
    
    --procedure para actualizar solicitudmodificacion por producto codigo
    procedure pUpdatesolicitudmodificacionproductocodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type) is
    begin
        update solicitudmodificacion
        set solicitudcodigo = Esolicitudcodigo
        where solicitudmodificacion.productocodigo = Eproductocodigo;
    end pUpdatesolicitudmodificacionproductocodigo;
    
    --procedure para borrar asignacion por solicitud codigo
    procedure pDeletesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type) is
    begin
        delete from solicitudmodificacion
        where solicitudmodificacion.solicitudcodigo = Esolicitudcodigo;
    end pDeletesolicitudmodificacionsolicitudcodigo;
    
    --procedure para borrar asignacion por producto codigo
    procedure pDeletesolicitudmodificacionproductocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type) is
    begin
        delete from solicitudmodificacion
        where solicitudmodificacion.productocodigo = Eproductocodigo;
    end pDeletesolicitudmodificacionproductocodigo;
    
end pksolicitudmodificacion;