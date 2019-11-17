/*
package CRUD de funcionario
*/
create or replace package pkfuncionario is
    procedure pCreatefuncionario(cedula in funcionario.cedula%type, nombre in funcionario.nombre%type, fechanacimiento in funcionario.fechanacimiento%type, direccion in funcionario.direccion%type, telefono in funcionario.telefono%type, errorCod out number, errorName out varchar2);
    function fReadfuncionario(Ecedula in funcionario.cedula%type, errorCod out number, errorName out varchar2) return funcionario%rowtype;
    procedure pUpdatefuncionario(Ecedula in funcionario.cedula%type, Enombre in funcionario.nombre%type, Efechanacimiento in funcionario.fechanacimiento%type, Edireccion in funcionario.direccion%type, Etelefono in funcionario.telefono%type, errorCod out number, errorName out varchar2);
    procedure pDeletefuncionario(Ecedula in funcionario.cedula%type, errorCod out number, errorName out varchar2);
end pkfuncionario;
/
/*
package body CRUD de funcionario
*/
create or replace package body pkfuncionario is
    /*
	procedure para añadir funcionario
	*/
    procedure pCreatefuncionario(cedula in funcionario.cedula%type, nombre in funcionario.nombre%type, fechanacimiento in funcionario.fechanacimiento%type, direccion in funcionario.direccion%type, telefono in funcionario.telefono%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        insert into funcionario values (cedula, nombre, fechanacimiento, direccion, telefono);
        EXCEPTION
            when dup_val_on_index then
            errorCod := 1;
            errorName := 'funcionario';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pCreatefuncionario;
	/*
    function para leer funcionario
	*/
    function fReadfuncionario(Ecedula in funcionario.cedula%type, errorCod out number, errorName out varchar2) return funcionario%rowtype is
    rc funcionario%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from funcionario
        where funcionario.cedula = Ecedula;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'funcionario';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadfuncionario;
	/*
    procedure para actualizar funcionario
	*/
    procedure pUpdatefuncionario(Ecedula in funcionario.cedula%type, Enombre in funcionario.nombre%type, Efechanacimiento in funcionario.fechanacimiento%type, Edireccion in funcionario.direccion%type, Etelefono in funcionario.telefono%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update funcionario
        set nombre = Enombre, fechanacimiento = Efechanacimiento, direccion = Edireccion, telefono = Etelefono
        where funcionario.cedula = Ecedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'funcionario';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdatefuncionario;
	/*
    procedure para borrar funcionario
	*/
    procedure pDeletefuncionario(ECedula in funcionario.cedula%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from funcionario
        where funcionario.cedula = Ecedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'funcionario';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeletefuncionario;

end pkfuncionario;
/