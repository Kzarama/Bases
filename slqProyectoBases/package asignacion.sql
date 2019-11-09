--package of asignacion
create or replace package pkAsignacion is
    procedure pCreateAsignacion(fechaAsignacion in asignacion.fechaAsignacion%type, fechaAtencion in asignacion.fechaAtencion%type, funcionarioCedula in asignacion.funcionarioCedula%type, solicitudCodigo in asignacion.solicitudCodigo%type, funcionarioComentario in asignacion.funcionarioComentario%type, atendido in asignacion.atendido%type);
    function fReadAsignacionfuncionariocedula(EFuncionarioCedula in asignacion.FuncionarioCedula%type) return asignacion%rowtype;
    function fReadAsignacionsolicitudCodigo(EsolicitudCodigo in asignacion.solicitudcodigo%type) return asignacion%rowtype;
    procedure pUpdateAsignacionfuncionariocedula(EfechaAsignacion in asignacion.fechaAsignacion%type, EfechaAtencion in asignacion.fechaAtencion%type, EfuncionarioCedula in asignacion.funcionarioCedula%type, EsolicitudCodigo in asignacion.solicitudCodigo%type, EfuncionarioComentario in asignacion.funcionarioComentario%type, Eatendido in asignacion.atendido%type);
    procedure pUpdateAsignacionsolicitudCodigo(EfechaAsignacion in asignacion.fechaAsignacion%type, EfechaAtencion in asignacion.fechaAtencion%type, EfuncionarioCedula in asignacion.funcionarioCedula%type, EsolicitudCodigo in asignacion.solicitudCodigo%type, EfuncionarioComentario in asignacion.funcionarioComentario%type, Eatendido in asignacion.atendido%type);
    procedure pDeleteAsignacionfuncionariocedula(EfuncionarioCedula in asignacion.funcionarioCedula%type);
    procedure pDeleteAsignacionsolicitudCodigo(EsolicitudCodigo in asignacion.solicitudCodigo%type);
end pkAsignacion;

create or replace package body pkAsignacion is
    --procedure para añadir asignacion
    procedure pCreateAsignacion(fechaAsignacion in asignacion.fechaAsignacion%type, fechaAtencion in asignacion.fechaAtencion%type, funcionarioCedula in asignacion.funcionarioCedula%type, solicitudCodigo in asignacion.solicitudCodigo%type, funcionarioComentario in asignacion.funcionarioComentario%type, atendido in asignacion.atendido%type) is
    begin
        insert into asignacion values (fechaAsignacion, fechaAtencion, funcionarioCedula, solicitudCodigo, funcionarioComentario , atendido);
    end pCreateAsignacion;
    
    --function para leer asignacion por funcionario cedulas
    function fReadAsignacionfuncionariocedula(EFuncionarioCedula in asignacion.FuncionarioCedula%type) return asignacion%rowtype is
    rc asignacion%rowtype;
    begin
        select * into rc
        from asignacion
        where asignacion.FuncionarioCedula = EFuncionarioCedula;
        return rc;
    end fReadAsignacionfuncionariocedula;
    
    --function para leer asignacion por codigo de solicitud
    function fReadAsignacionsolicitudCodigo(EsolicitudCodigo in asignacion.solicitudcodigo%type) return asignacion%rowtype is
    rc asignacion%rowtype;
    begin
        select * into rc
        from asignacion
        where asignacion.solicitudCodigo = EsolicitudCodigo;
        return rc;
    end fReadAsignacionsolicitudCodigo;
    
    --procedure para actualizar asignacion por cedula funcionario
    procedure pUpdateAsignacionfuncionariocedula(EfechaAsignacion in asignacion.fechaAsignacion%type, EfechaAtencion in asignacion.fechaAtencion%type, EfuncionarioCedula in asignacion.funcionarioCedula%type, EsolicitudCodigo in asignacion.solicitudCodigo%type, EfuncionarioComentario in asignacion.funcionarioComentario%type, Eatendido in asignacion.atendido%type) is
    begin
        update asignacion
        set fechaAsignacion = EfechaAsignacion, fechaAtencion = EfechaAtencion, solicitudCodigo = EsolicitudCodigo, funcionarioComentario = EfuncionarioComentario, atendido = Eatendido
        where asignacion.funcionarioCedula = EfuncionarioCedula;
    end pUpdateAsignacionfuncionariocedula;

    --procedure para actualizar asignacion por codigo solicitud
    procedure pUpdateAsignacionsolicitudCodigo(EfechaAsignacion in asignacion.fechaAsignacion%type, EfechaAtencion in asignacion.fechaAtencion%type, EfuncionarioCedula in asignacion.funcionarioCedula%type, EsolicitudCodigo in asignacion.solicitudCodigo%type, EfuncionarioComentario in asignacion.funcionarioComentario%type, Eatendido in asignacion.atendido%type) is
    begin
        update asignacion
        set fechaAsignacion = EfechaAsignacion, fechaAtencion = EfechaAtencion, solicitudCodigo = EsolicitudCodigo, funcionarioComentario = EfuncionarioComentario, atendido = Eatendido
        where asignacion.solicitudCodigo = EsolicitudCodigo;
    end pUpdateAsignacionsolicitudCodigo;

    --procedure para borrar asignacion por funcionario cedula
    procedure pDeleteAsignacionfuncionariocedula(EfuncionarioCedula in asignacion.funcionarioCedula%type) is
    begin
        delete from asignacion
        where asignacion.funcionarioCedula = EfuncionarioCedula;
    end pDeleteAsignacionfuncionariocedula;
    
    --procedure para borrar asignacion por solicitud codigo
    procedure pDeleteAsignacionsolicitudCodigo(EsolicitudCodigo in asignacion.solicitudCodigo%type) is
    begin
        delete from asignacion
        where asignacion.solicitudCodigo = EsolicitudCodigo;
    end pDeleteAsignacionsolicitudCodigo;    
    
end pkAsignacion;