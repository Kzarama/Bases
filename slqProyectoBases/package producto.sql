--package of producto
create or replace package pkproducto is
    procedure pCreateproducto(codigo in producto.codigo%type, descripcion in producto.descripcion%type, tipo in producto.tipo%type);
    function fReadProducto(Ecodigo in producto.codigo%type) return producto%rowtype;
    procedure pUpdateproducto(Ecodigo in producto.codigo%type, Edescripcion in producto.descripcion%type, Etipo in producto.tipo%type);
    procedure pDeleteproducto(Ecodigo in producto.codigo%type);
end pkproducto;

create or replace package body pkproducto is
    --procedure para añadir producto
    procedure pCreateproducto(codigo in producto.codigo%type, descripcion in producto.descripcion%type, tipo in producto.tipo%type) is
    begin
        insert into producto values (codigo, descripcion, tipo);
    end pCreateproducto;
    
    --function para leer producto
    function fReadProducto(Ecodigo in producto.codigo%type) return producto%rowtype is
    rc producto%rowtype;
    begin
        select * into rc
        from producto
        where producto.codigo = Ecodigo;
        return rc;
    end fReadProducto;

    --procedure para actualizar producto
    procedure pUpdateproducto(Ecodigo in producto.codigo%type, Edescripcion in producto.descripcion%type, Etipo in producto.tipo%type) is
    begin
        update producto
        set descripcion = Edescripcion, tipo = Etipo
        where producto.codigo = Ecodigo;
    end pUpdateproducto;
    
    --procedure para borrar asignacion
    procedure pDeleteproducto(Ecodigo in producto.codigo%type) is
    begin
        delete from producto
        where producto.codigo = Ecodigo;
    end pDeleteproducto;

end pkproducto;