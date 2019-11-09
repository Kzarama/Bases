--package of solicitudreportedanio
create or replace package pksolicitudreportedanio is
    procedure pCreatesolicitudreportedanio(solicitudcodigo in solicitudreportedanio.solicitudcodigo%type, anomaliaid in solicitudreportedanio.anomaliaid%type);
    function fReadsolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type) return solicitudreportedanio%rowtype;
    function fReadsolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type) return solicitudreportedanio%rowtype;
    procedure pUpdatesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type);
    procedure pUpdatesolicitudreportedanioanomaliaid(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type);
    procedure pDeletesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type);
    procedure pDeletesolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type);
end pksolicitudreportedanio;

create or replace package body pksolicitudreportedanio is
    --procedure para añadir solicitudreportedanio
    procedure pCreatesolicitudreportedanio(solicitudcodigo in solicitudreportedanio.solicitudcodigo%type, anomaliaid in solicitudreportedanio.anomaliaid%type) is
    begin
        insert into solicitudreportedanio values (solicitudcodigo, anomaliaid);
    end pCreatesolicitudreportedanio;
    
    --function para leer solicitud reporte danio por solicitud codigo
    function fReadsolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type) return solicitudreportedanio%rowtype is
    rc solicitudreportedanio%rowtype;
    begin
        select * into rc
        from solicitudreportedanio
        where solicitudreportedanio.solicitudcodigo = Esolicitudcodigo;
        return rc;
    end fReadsolicitudreportedaniosolicitudcodigo;

    --function para leer solicitud reporte danio anomalia id
    function fReadsolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type) return solicitudreportedanio%rowtype is
    rc solicitudreportedanio%rowtype;
    begin
        select * into rc
        from solicitudreportedanio
        where solicitudreportedanio.anomaliaid = Eanomaliaid;
        return rc;
    end fReadsolicitudreportedanioanomaliaid;
    
    --procedure para actualizar solicitudreportedanio por solicitud codigo
    procedure pUpdatesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type) is
    begin
        update solicitudreportedanio
        set solicitudcodigo = Esolicitudcodigo
        where solicitudreportedanio.anomaliaid = Eanomaliaid;
    end pUpdatesolicitudreportedaniosolicitudcodigo;
    
    --procedure para actualizar solicitudreportedanio por anomalia id
    procedure pUpdatesolicitudreportedanioanomaliaid(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type) is
    begin
        update solicitudreportedanio
        set anomaliaid = Eanomaliaid
        where solicitudreportedanio.solicitudcodigo = Esolicitudcodigo;
    end pUpdatesolicitudreportedanioanomaliaid;
    
    --procedure para borrar asignacion por solicitud codigo
    procedure pDeletesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type) is
    begin
        delete from solicitudreportedanio
        where solicitudreportedanio.solicitudcodigo = Esolicitudcodigo;
    end pDeletesolicitudreportedaniosolicitudcodigo;
    
    --procedure para borrar asignacion por anomalia id
    procedure pDeletesolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type) is
    begin
        delete from solicitudreportedanio
        where solicitudreportedanio.anomaliaid = Eanomaliaid;
    end pDeletesolicitudreportedanioanomaliaid;
    
end pksolicitudreportedanio;