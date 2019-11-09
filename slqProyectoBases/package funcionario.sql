--package of funcionario
create or replace package pkfuncionario is
    procedure pCreatefuncionario(cedula in funcionario.cedula%type, nombre in funcionario.nombre%type, fechanacimiento in funcionario.fechanacimiento%type, direccion in funcionario.direccion%type, telefono in funcionario.telefono%type);
    function fReadfuncionario(Ecedula in funcionario.cedula%type) return funcionario%rowtype;
    procedure pUpdatefuncionario(Ecedula in funcionario.cedula%type, Enombre in funcionario.nombre%type, Efechanacimiento in funcionario.fechanacimiento%type, Edireccion in funcionario.direccion%type, Etelefono in funcionario.telefono%type);
    procedure pDeletefuncionario(Ecedula in funcionario.cedula%type);
end pkfuncionario;

create or replace package body pkfuncionario is
    --procedure para añadir funcionario
    procedure pCreatefuncionario(cedula in funcionario.cedula%type, nombre in funcionario.nombre%type, fechanacimiento in funcionario.fechanacimiento%type, direccion in funcionario.direccion%type, telefono in funcionario.telefono%type) is
    begin
        insert into funcionario values (cedula, nombre, fechanacimiento, direccion, telefono);
    end pCreatefuncionario;
    
    --function para leer funcionario
    function fReadfuncionario(Ecedula in funcionario.cedula%type) return funcionario%rowtype is
    rc funcionario%rowtype;
    begin
        select * into rc
        from funcionario
        where funcionario.cedula = Ecedula;
        return rc;
    end fReadfuncionario;
    
    --procedure para actualizar funcionario
    procedure pUpdatefuncionario(Ecedula in funcionario.cedula%type, Enombre in funcionario.nombre%type, Efechanacimiento in funcionario.fechanacimiento%type, Edireccion in funcionario.direccion%type, Etelefono in funcionario.telefono%type) is
    begin
        update funcionario
        set nombre = Enombre, fechanacimiento = Efechanacimiento, direccion = Edireccion, telefono = Etelefono
        where funcionario.cedula = Ecedula;
    end pUpdatefuncionario;
    
    --procedure para borrar asignacion
    procedure pDeletefuncionario(ECedula in funcionario.cedula%type) is
    begin
        delete from funcionario
        where funcionario.cedula = Ecedula;
    end pDeletefuncionario;

end pkfuncionario;