create or replace package pkproducto is
    procedure pCreateproducto(codigo in producto.codigo%type, descripcion in producto.descripcion%type, tipo in producto.tipo%type, errorCod out number, errorName out varchar2);
    function fReadProducto(Ecodigo in producto.codigo%type, errorCod out number, errorName out varchar2) return producto%rowtype;
    procedure pUpdateproducto(Ecodigo in producto.codigo%type, Edescripcion in producto.descripcion%type, Etipo in producto.tipo%type, errorCod out number, errorName out varchar2);
    procedure pDeleteproducto(Ecodigo in producto.codigo%type, errorCod out number, errorName out varchar2);
end pkproducto;

create or replace package body pkproducto is
    --procedure para añadir producto
    procedure pCreateproducto(codigo in producto.codigo%type, descripcion in producto.descripcion%type, tipo in producto.tipo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        insert into producto values (codigo, descripcion, tipo);
        EXCEPTION
            when dup_val_on_index then
            errorCod := 1;
            errorName := 'anomalia';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pCreateproducto;
    
    --function para leer producto
    function fReadProducto(Ecodigo in producto.codigo%type, errorCod out number, errorName out varchar2) return producto%rowtype is
    rc producto%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from producto
        where producto.codigo = Ecodigo;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadProducto;

    --procedure para actualizar producto
    procedure pUpdateproducto(Ecodigo in producto.codigo%type, Edescripcion in producto.descripcion%type, Etipo in producto.tipo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update producto
        set descripcion = Edescripcion, tipo = Etipo
        where producto.codigo = Ecodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdateproducto;
    
    --procedure para borrar asignacion
    procedure pDeleteproducto(Ecodigo in producto.codigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from producto
        where producto.codigo = Ecodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeleteproducto;

end pkproducto;