create or replace package pkAnomalia is
    procedure pCreateAnomalia(id in anomalia.id%type, descripcion in anomalia.descripcion%type);
    function fReadAnomalia(Eid in anomalia.id%type) return anomalia%rowtype;
    procedure pUpdateAnomalia(Eid in anomalia.id%type, Edescripcion in anomalia.descripcion%type);
    procedure pDeleteAnomalia(Eid in anomalia.id%type);
end pkAnomalia;

create or replace package body pkAnomalia is
    --procedure para añadir anomalia
    procedure pCreateAnomalia(id in anomalia.id%type, descripcion in anomalia.descripcion%type) is
    begin
        insert into anomalia values (id, descripcion);
    end pCreateAnomalia;

    --function para leer anomalia
    function fReadAnomalia(Eid in anomalia.id%type) return anomalia%rowtype is
    rc anomalia%rowtype;
    begin
        select * into rc
        from anomalia
        where anomalia.id = Eid;
        return rc;
    end fReadAnomalia;

    --procedure para actualizar anomalia
    procedure pUpdateAnomalia(Eid in anomalia.id%type, Edescripcion in anomalia.descripcion%type) is
    begin
        update anomalia
        set descripcion = Edescripcion
        where anomalia.id = Eid;
    end pUpdateAnomalia;

    --procedure para borrar anomalia
    procedure pDeleteAnomalia(Eid in anomalia.id%type) is
    begin
        delete from anomalia
        where anomalia.id = Eid;
    end pDeleteAnomalia;

end pkAnomalia;