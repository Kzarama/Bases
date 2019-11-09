--package of solicitud
create or replace package pksolicitud is
    procedure pCreatesolicitud(codigo in solicitud.codigo%type, estado in solicitud.estado%type, descripcion in solicitud.descripcion%type, clientecedula in solicitud.clientecedula%type, productocodigo in solicitud.productocodigo%type, fechacreacion in solicitud.fechacreacion%type, tipo in solicitud.tipo%type);
    function fReadsolicitudcodigo(Ecodigo in solicitud.codigo%type) return solicitud%rowtype;
    function fReadsolicitudclientecedula(Eclientecedula in solicitud.clientecedula%type) return solicitud%rowtype;
    function fReadsolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type) return solicitud%rowtype;
    procedure pUpdatesolicitudcodigo(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type);
    procedure pUpdatesolicitudclientecedula(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type);
    procedure pUpdatesolicitudcodigoproducto(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type);
    procedure pDeletesolicitudcodigo(Ecodigo in solicitud.codigo%type);
    procedure pDeletesolicitudClientecedula(Eclientecedula in solicitud.clientecedula%type);
    procedure pDeletesolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type);
end pksolicitud;

create or replace package body pksolicitud is
    --procedure para añadir solicitud
    procedure pCreatesolicitud(codigo in solicitud.codigo%type, estado in solicitud.estado%type, descripcion in solicitud.descripcion%type, clientecedula in solicitud.clientecedula%type, productocodigo in solicitud.productocodigo%type, fechacreacion in solicitud.fechacreacion%type, tipo in solicitud.tipo%type) is
    begin
        insert into solicitud values (codigo, estado, descripcion, clientecedula, productocodigo, fechacreacion, tipo);
    end pCreatesolicitud;
    
    --function para leer solicitud por codigo
    function fReadsolicitudcodigo(Ecodigo in solicitud.codigo%type) return solicitud%rowtype is
    rc solicitud%rowtype;
    begin
        select * into rc
        from solicitud
        where solicitud.codigo = Ecodigo;
        return rc;
    end fReadsolicitudcodigo;
    
    --function para leer solicitud por cedula cliente
    function fReadsolicitudclientecedula(Eclientecedula in solicitud.clientecedula%type) return solicitud%rowtype is
    rc solicitud%rowtype;
    begin
        select * into rc
        from solicitud
        where solicitud.clientecedula = Eclientecedula;
        return rc;
    end fReadsolicitudclientecedula;
    
    --function para leer solicitud por producto codigo
    function fReadsolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type) return solicitud%rowtype is
    rc solicitud%rowtype;
    begin
        select * into rc
        from solicitud
        where solicitud.productocodigo = Eproductocodigo;
        return rc;
    end fReadsolicitudproductocodigo;
    
    --procedure para actualizar solicitud
    procedure pUpdatesolicitudcodigo(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type) is
    begin
        update solicitud
        set estado = Eestado, descripcion = Edescripcion, clientecedula = Eclientecedula, productocodigo = Eproductocodigo, fechacreacion = Efechacreacion, tipo = Etipo
        where solicitud.codigo = Ecodigo;
    end pUpdatesolicitudcodigo;
    
    --procedure para actualizar solicitud por cedula cliente
    procedure pUpdatesolicitudclientecedula(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type) is
    begin
        update solicitud
        set estado = Eestado, descripcion = Edescripcion, codigo = Ecodigo, productocodigo = Eproductocodigo, fechacreacion = Efechacreacion, tipo = Etipo
        where solicitud.clientecedula = Eclientecedula;
    end pUpdatesolicitudclientecedula;
    
    --procedure para actualizar solicitud por codigo producto
    procedure pUpdatesolicitudcodigoproducto(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type) is
    begin
        update solicitud
        set estado = Eestado, descripcion = Edescripcion, clientecedula = Eclientecedula, codigo = Ecodigo, fechacreacion = Efechacreacion, tipo = Etipo
        where solicitud.productocodigo = Eproductocodigo;
    end pUpdatesolicitudcodigoproducto;
    
    --procedure para borrar asignacion por codigo
    procedure pDeletesolicitudcodigo(Ecodigo in solicitud.codigo%type) is
    begin
        delete from solicitud
        where solicitud.codigo = Ecodigo;
    end pDeletesolicitudcodigo;
    
    --procedure para borrar asignacion por cedula cliente
    procedure pDeletesolicitudClientecedula(Eclientecedula in solicitud.clientecedula%type) is
    begin
        delete from solicitud
        where solicitud.clientecedula = Eclientecedula;
    end pDeletesolicitudClientecedula;
    
    --procedure para borrar asignacion por codigo producto
    procedure pDeletesolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type) is
    begin
        delete from solicitud
        where solicitud.productocodigo = Eproductocodigo;
    end pDeletesolicitudproductocodigo;
    
end pksolicitud;