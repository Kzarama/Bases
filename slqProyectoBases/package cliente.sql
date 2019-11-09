--package of cliente
create or replace package pkCliente is
    procedure pCreateCliente(cedula in cliente.cedula%type, nombre in cliente.nombre%type, fechanacimiento in cliente.fechanacimiento%type, direccion in cliente.direccion%type, telefono in cliente.telefono%type);
    function fReadCliente(Ecedula in cliente.cedula%type) return cliente%rowtype;
    procedure pUpdateCliente(Ecedula in cliente.cedula%type, Enombre in cliente.nombre%type, Efechanacimiento in cliente.fechanacimiento%type, Edireccion in cliente.direccion%type, Etelefono in cliente.telefono%type);
    procedure pDeleteCliente(Ecedula in cliente.cedula%type);
end pkCliente;

create or replace package body pkCliente is
    --procedure para añadir cliente
    procedure pCreateCliente(cedula in cliente.cedula%type, nombre in cliente.nombre%type, fechanacimiento in cliente.fechanacimiento%type, direccion in cliente.direccion%type, telefono in cliente.telefono%type) is
    begin
        insert into cliente values (cedula, nombre, fechanacimiento, direccion, telefono);
    end pCreateCliente;

    --function para leer cliente
    function fReadCliente(Ecedula in cliente.cedula%type) return cliente%rowtype is
    rc cliente%rowtype;
    begin
        select * into rc
        from cliente
        where cliente.cedula = Ecedula;
        return rc;
    end fReadCliente;
    
    --procedure para actualizar cliente
    procedure pUpdateCliente(Ecedula in cliente.cedula%type, Enombre in cliente.nombre%type, Efechanacimiento in cliente.fechanacimiento%type, Edireccion in cliente.direccion%type, Etelefono in cliente.telefono%type) is
    begin
        update cliente
        set nombre = Enombre, fechanacimiento = Efechanacimiento, direccion = Edireccion, telefono = Etelefono
        where cliente.cedula = Ecedula;
    end pUpdateCliente;
    
    --procedure para borrar asignacion
    procedure pDeleteCliente(ECedula in cliente.cedula%type) is
    begin
        delete from cliente
        where cliente.cedula = Ecedula;
    end pDeleteCliente;

end pkCliente;