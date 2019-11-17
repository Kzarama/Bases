create or replace package pkCliente is
    procedure pCrearCliente(cedula in cliente.cedula%type, nombre in cliente.nombre%type, fechanacimiento in cliente.fechanacimiento%type, direccion in cliente.direccion%type, telefono in cliente.telefono%type, errorCod out number, errorName out varchar2);
    function fReadCliente(Ecedula in cliente.cedula%type, errorCod out number, errorName out varchar2) return cliente%rowtype;
    procedure pUpdateCliente(Ecedula in cliente.cedula%type, Enombre in cliente.nombre%type, Efechanacimiento in cliente.fechanacimiento%type, Edireccion in cliente.direccion%type, Etelefono in cliente.telefono%type, errorCod out number, errorName out varchar2);
    procedure pDeleteCliente(Ecedula in cliente.cedula%type, errorCod out number, errorName out varchar2);
end pkCliente;

create or replace package body pkCliente is
    --procedure para añadir cliente
    procedure pCrearCliente(cedula in cliente.cedula%type, nombre in cliente.nombre%type, fechanacimiento in cliente.fechanacimiento%type, direccion in cliente.direccion%type, telefono in cliente.telefono%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        insert into cliente values (cedula, nombre, fechanacimiento, direccion, telefono);
        EXCEPTION
            when dup_val_on_index then
            errorCod := 1;
            errorName := 'cliente';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pCrearCliente;

    --function para leer cliente
    function fReadCliente(Ecedula in cliente.cedula%type, errorCod out number, errorName out varchar2) return cliente%rowtype is
    rc cliente%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from cliente
        where cliente.cedula = Ecedula;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'cliente';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadCliente;

    --procedure para actualizar cliente
    procedure pUpdateCliente(Ecedula in cliente.cedula%type, Enombre in cliente.nombre%type, Efechanacimiento in cliente.fechanacimiento%type, Edireccion in cliente.direccion%type, Etelefono in cliente.telefono%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update cliente
        set nombre = Enombre, fechanacimiento = Efechanacimiento, direccion = Edireccion, telefono = Etelefono
        where cliente.cedula = Ecedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'cliente';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdateCliente;

    --procedure para borrar asignacion
    procedure pDeleteCliente(ECedula in cliente.cedula%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from cliente
        where cliente.cedula = Ecedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'cliente';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeleteCliente;

end pkCliente;