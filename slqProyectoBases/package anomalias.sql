/*
package CRUD de anomalia
*/
create or replace package pkAnomalia is
    procedure pCreateAnomalia(id in anomalia.id%type, descripcion in anomalia.descripcion%type, errorCod out number, errorName out varchar2);
    function fReadAnomalia(Eid in anomalia.id%type, errorCod out number, errorName out varchar2) return anomalia%rowtype;
    procedure pUpdateAnomalia(Eid in anomalia.id%type, Edescripcion in anomalia.descripcion%type, errorCod out number, errorName out varchar2);
    procedure pDeleteAnomalia(Eid in anomalia.id%type, errorCod out number, errorName out varchar2);
end pkAnomalia;
/*
package body CRUD de anomalia
*/
create or replace package body pkAnomalia is
    /*
	procedure para añadir anomalia
	*/
    procedure pCreateAnomalia(id in anomalia.id%type, descripcion in anomalia.descripcion%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        insert into anomalia values (id, descripcion);
        EXCEPTION
            when dup_val_on_index then
            errorCod := 1;
            errorName := 'anomalia';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pCreateAnomalia;
	/*
    function para leer anomalia
	*/
    function fReadAnomalia(Eid in anomalia.id%type, errorCod out number, errorName out varchar2) return anomalia%rowtype is
    rc anomalia%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from anomalia
        where anomalia.id = Eid;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'anomalia';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadAnomalia;
	/*
    procedure para actualizar anomalia
	*/
    procedure pUpdateAnomalia(Eid in anomalia.id%type, Edescripcion in anomalia.descripcion%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update anomalia
        set descripcion = Edescripcion
        where anomalia.id = Eid;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'anomalia';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdateAnomalia;
	/*
	procedure para borrar anomalia
	*/
    procedure pDeleteAnomalia(Eid in anomalia.id%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from anomalia
        where anomalia.id = Eid;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'anomalia';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeleteAnomalia;

end pkAnomalia;