/*
package CRUD de asignacion
*/
create or replace package pkAsignacion is
    procedure pCreateAsignacion(fechaAsignacion in asignacion.fechaAsignacion%type, fechaAtencion in asignacion.fechaAtencion%type, funcionarioCedula in asignacion.funcionarioCedula%type, solicitudCodigo in asignacion.solicitudCodigo%type, funcionarioComentario in asignacion.funcionarioComentario%type, atendido in asignacion.atendido%type, errorCod out number, errorName out varchar2);
    function fReadAsignacionfuncionariocedula(EFuncionarioCedula in asignacion.FuncionarioCedula%type, errorCod out number, errorName out varchar2) return asignacion%rowtype;
    function fReadAsignacionsolicitudCodigo(EsolicitudCodigo in asignacion.solicitudcodigo%type, errorCod out number, errorName out varchar2) return asignacion%rowtype;
    procedure pUpdateAsignacionfuncionariocedula(EfechaAsignacion in asignacion.fechaAsignacion%type, EfechaAtencion in asignacion.fechaAtencion%type, EfuncionarioCedula in asignacion.funcionarioCedula%type, EsolicitudCodigo in asignacion.solicitudCodigo%type, EfuncionarioComentario in asignacion.funcionarioComentario%type, Eatendido in asignacion.atendido%type, errorCod out number, errorName out varchar2);
    procedure pUpdateAsignacionsolicitudCodigo(EfechaAsignacion in asignacion.fechaAsignacion%type, EfechaAtencion in asignacion.fechaAtencion%type, EfuncionarioCedula in asignacion.funcionarioCedula%type, EsolicitudCodigo in asignacion.solicitudCodigo%type, EfuncionarioComentario in asignacion.funcionarioComentario%type, Eatendido in asignacion.atendido%type, errorCod out number, errorName out varchar2);
    procedure pDeleteAsignacionfuncionariocedula(EfuncionarioCedula in asignacion.funcionarioCedula%type, errorCod out number, errorName out varchar2);
    procedure pDeleteAsignacionsolicitudCodigo(EsolicitudCodigo in asignacion.solicitudCodigo%type, errorCod out number, errorName out varchar2);
end pkAsignacion;
/
/*
package body CRUD de asignacion
*/
create or replace package body pkAsignacion is
    /*
	procedure para añadir asignacion
	*/
    procedure pCreateAsignacion(fechaAsignacion in asignacion.fechaAsignacion%type, fechaAtencion in asignacion.fechaAtencion%type, funcionarioCedula in asignacion.funcionarioCedula%type, solicitudCodigo in asignacion.solicitudCodigo%type, funcionarioComentario in asignacion.funcionarioComentario%type, atendido in asignacion.atendido%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        insert into asignacion values (fechaAsignacion, fechaAtencion, funcionarioCedula, solicitudCodigo, funcionarioComentario , atendido);
        EXCEPTION
            when dup_val_on_index then
            errorCod := 1;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pCreateAsignacion;
	/*
	function para leer asignacion por funcionario cedulas
	*/
    function fReadAsignacionfuncionariocedula(EFuncionarioCedula in asignacion.FuncionarioCedula%type, errorCod out number, errorName out varchar2) return asignacion%rowtype is
    rc asignacion%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from asignacion
        where asignacion.FuncionarioCedula = EFuncionarioCedula;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadAsignacionfuncionariocedula;
	/*
	function para leer asignacion por codigo de solicitud
	*/
    function fReadAsignacionsolicitudCodigo(EsolicitudCodigo in asignacion.solicitudcodigo%type, errorCod out number, errorName out varchar2) return asignacion%rowtype is
    rc asignacion%rowtype;
    begin
        errorCod := 0;
        errorName := '';
        select * into rc
        from asignacion
        where asignacion.solicitudCodigo = EsolicitudCodigo;
        return rc;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end fReadAsignacionsolicitudCodigo;
	/*
	procedure para actualizar asignacion por cedula funcionario
	*/
    procedure pUpdateAsignacionfuncionariocedula(EfechaAsignacion in asignacion.fechaAsignacion%type, EfechaAtencion in asignacion.fechaAtencion%type, EfuncionarioCedula in asignacion.funcionarioCedula%type, EsolicitudCodigo in asignacion.solicitudCodigo%type, EfuncionarioComentario in asignacion.funcionarioComentario%type, Eatendido in asignacion.atendido%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update asignacion
        set fechaAsignacion = EfechaAsignacion, fechaAtencion = EfechaAtencion, solicitudCodigo = EsolicitudCodigo, funcionarioComentario = EfuncionarioComentario, atendido = Eatendido
        where asignacion.funcionarioCedula = EfuncionarioCedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdateAsignacionfuncionariocedula;
	/*
	procedure para actualizar asignacion por codigo solicitud
	*/
    procedure pUpdateAsignacionsolicitudCodigo(EfechaAsignacion in asignacion.fechaAsignacion%type, EfechaAtencion in asignacion.fechaAtencion%type, EfuncionarioCedula in asignacion.funcionarioCedula%type, EsolicitudCodigo in asignacion.solicitudCodigo%type, EfuncionarioComentario in asignacion.funcionarioComentario%type, Eatendido in asignacion.atendido%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        update asignacion
        set fechaAsignacion = EfechaAsignacion, fechaAtencion = EfechaAtencion, solicitudCodigo = EsolicitudCodigo, funcionarioComentario = EfuncionarioComentario, atendido = Eatendido
        where asignacion.solicitudCodigo = EsolicitudCodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pUpdateAsignacionsolicitudCodigo;
	/*
	procedure para borrar asignacion por funcionario cedula
	*/
    procedure pDeleteAsignacionfuncionariocedula(EfuncionarioCedula in asignacion.funcionarioCedula%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from asignacion
        where asignacion.funcionarioCedula = EfuncionarioCedula;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeleteAsignacionfuncionariocedula;
	/*
	procedure para borrar asignacion por solicitud codigo
	*/
    procedure pDeleteAsignacionsolicitudCodigo(EsolicitudCodigo in asignacion.solicitudCodigo%type, errorCod out number, errorName out varchar2) is
    begin
        errorCod := 0;
        errorName := '';
        delete from asignacion
        where asignacion.solicitudCodigo = EsolicitudCodigo;
        EXCEPTION
            when dup_val_on_index then
            errorCod := 2;
            errorName := 'asignacion';
            when OTHERS then
            errorCod := 9;
            errorname := 'desconocido';
    end pDeleteAsignacionsolicitudCodigo;    

end pkAsignacion;
/