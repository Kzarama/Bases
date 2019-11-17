create or replace package pkservicio is
    procedure pCreateservicio(productocodigo in servicio.productocodigo%type, clientecedula in servicio.clientecedula%type, fechainicio in servicio.fechainicio%type, fechaterminacion in servicio.fechaterminacion%type, errorCod out number, errorName out varchar2);
    function fReadservicioproductocodigo(Eproductocodigo in servicio.productocodigo%type, errorCod out number, errorName out varchar2) return servicio%rowtype;
    function fReadservicioclientecedula(Eclientecedula in servicio.clientecedula%type, errorCod out number, errorName out varchar2) return servicio%rowtype;
    procedure pUpdateservicioproductocodigo(Eproductocodigo in servicio.productocodigo%type, Eclientecedula in servicio.clientecedula%type, Efechainicio in servicio.fechainicio%type, Efechaterminacion in servicio.fechaterminacion%type, errorCod out number, errorName out varchar2);
    procedure pUpdateservicioclientecedula(Eproductocodigo in servicio.productocodigo%type, Eclientecedula in servicio.clientecedula%type, Efechainicio in servicio.fechainicio%type, Efechaterminacion in servicio.fechaterminacion%type, errorCod out number, errorName out varchar2);
    procedure pDeleteservicioproductocodigo(Eproductocodigo in servicio.productocodigo%type, errorCod out number, errorName out varchar2);
    procedure pDeleteservicioclientecedula(Eclientecedula in servicio.clientecedula%type, errorCod out number, errorName out varchar2);
end pkservicio;

create or replace package body pkservicio is
    --procedure para añadir servicio
    procedure pCreateservicio(productocodigo in servicio.productocodigo%type, clientecedula in servicio.clientecedula%type, fechainicio in servicio.fechainicio%type, fechaterminacion in servicio.fechaterminacion%type, errorCod out number, errorName out varchar2) is
    begin
        insert into servicio values (productocodigo, clientecedula, fechainicio, fechaterminacion);
        EXCEPTION
            when dup_val_on_index then
            errorCod := 1;
            errorName := 'servicio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pCreateservicio;

    --function para leer servicio por producto codigo
    function fReadservicioproductocodigo(Eproductocodigo in servicio.productocodigo%type, errorCod out number, errorName out varchar2) return servicio%rowtype is
    rc servicio%rowtype;
    begin
        select * into rc
        from servicio
        where servicio.productocodigo = Eproductocodigo;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'servicio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadservicioproductocodigo;

    --function para leer servicio por producto codigo
    function fReadservicioclientecedula(Eclientecedula in servicio.clientecedula%type, errorCod out number, errorName out varchar2) return servicio%rowtype is
    rc servicio%rowtype;
    begin
        select * into rc
        from servicio
        where servicio.clientecedula = Eclientecedula;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'servicio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadservicioclientecedula;

    --procedure para actualizar servicio por codigo producto
    procedure pUpdateservicioproductocodigo(Eproductocodigo in servicio.productocodigo%type, Eclientecedula in servicio.clientecedula%type, Efechainicio in servicio.fechainicio%type, Efechaterminacion in servicio.fechaterminacion%type, errorCod out number, errorName out varchar2) is
    begin
        update servicio
        set clientecedula = Eclientecedula, fechainicio = Efechainicio, fechaterminacion = Efechaterminacion
        where servicio.productocodigo = Eproductocodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'servicio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdateservicioproductocodigo;

    --procedure para actualizar servicio por cliente cedula
    procedure pUpdateservicioclientecedula(Eproductocodigo in servicio.productocodigo%type, Eclientecedula in servicio.clientecedula%type, Efechainicio in servicio.fechainicio%type, Efechaterminacion in servicio.fechaterminacion%type, errorCod out number, errorName out varchar2) is
    begin
        update servicio
        set productocodigo = Eproductocodigo, fechainicio = Efechainicio, fechaterminacion = Efechaterminacion
        where servicio.clientecedula = Eclientecedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'servicio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdateservicioclientecedula;

    --procedure para borrar servicio
    procedure pDeleteservicioproductocodigo(Eproductocodigo in servicio.productocodigo%type, errorCod out number, errorName out varchar2) is
    begin
        delete from servicio
        where servicio.productocodigo = Eproductocodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'servicio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeleteservicioproductocodigo;

    --procedure para borrar servicio
    procedure pDeleteservicioclientecedula(Eclientecedula in servicio.clientecedula%type, errorCod out number, errorName out varchar2) is
    begin
        delete from servicio
        where servicio.clientecedula = Eclientecedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'servicio';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeleteservicioclientecedula;

end pkservicio;