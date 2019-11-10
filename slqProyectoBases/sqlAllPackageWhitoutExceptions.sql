--package of anomalia
create or replace package pkAnomalia is
    procedure pCreateAnomalia(id in anomalia.id%type, descripcion in anomalia.descripcion%type);
    function fReadAnomalia(Eid in anomalia.id%type) return anomalia%rowtype;
    procedure pUpdateAnomalia(Eid in anomalia.id%type, Edescripcion in anomalia.descripcion%type);
    procedure pDeleteAnomalia(Eid in anomalia.id%type);
end pkAnomalia;

create or replace package body pkAnomalia is
    --procedure para añadir anomalia
    procedure pCreateAnomalia(id in anomalia.id%type, descripcion in anomalia.descripcion%type) is
    begin
        insert into anomalia values (id, descripcion);
    end pCreateAnomalia;

    --function para leer anomalia
    function fReadAnomalia(Eid in anomalia.id%type) return anomalia%rowtype is
    rc anomalia%rowtype;
    begin
        select * into rc
        from anomalia
        where anomalia.id = Eid;
        return rc;
    end fReadAnomalia;

    --procedure para actualizar anomalia
    procedure pUpdateAnomalia(Eid in anomalia.id%type, Edescripcion in anomalia.descripcion%type) is
    begin
        update anomalia
        set descripcion = Edescripcion
        where anomalia.id = Eid;
    end pUpdateAnomalia;

    --procedure para borrar anomalia
    procedure pDeleteAnomalia(Eid in anomalia.id%type) is
    begin
        delete from anomalia
        where anomalia.id = Eid;
    end pDeleteAnomalia;

end pkAnomalia;

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

--package of solicitud
create or replace package pksolicitud is
    procedure pCreatesolicitud(codigo in solicitud.codigo%type, estado in solicitud.estado%type, descripcion in solicitud.descripcion%type, clientecedula in solicitud.clientecedula%type, productocodigo in solicitud.productocodigo%type, fechacreacion in solicitud.fechacreacion%type, tipo in solicitud.tipo%type);
    function fReadsolicitudcodigo(Ecodigo in solicitud.codigo%type) return solicitud%rowtype;
    function fReadsolicitudclientecedula(Eclientecedula in solicitud.clientecedula%type) return solicitud%rowtype;
    function fReadsolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type) return solicitud%rowtype;
    procedure pUpdatesolicitudcodigo(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type);
    procedure pUpdatesolicitudclientecedula(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type);
    procedure pUpdatesolicitudcodigoproducto(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type);
    procedure pDeletesolicitudcodigo(Ecodigo in solicitud.codigo%type);
    procedure pDeletesolicitudClientecedula(Eclientecedula in solicitud.clientecedula%type);
    procedure pDeletesolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type);
end pksolicitud;

create or replace package body pksolicitud is
    --procedure para añadir solicitud
    procedure pCreatesolicitud(codigo in solicitud.codigo%type, estado in solicitud.estado%type, descripcion in solicitud.descripcion%type, clientecedula in solicitud.clientecedula%type, productocodigo in solicitud.productocodigo%type, fechacreacion in solicitud.fechacreacion%type, tipo in solicitud.tipo%type) is
    begin
        insert into solicitud values (codigo, estado, descripcion, clientecedula, productocodigo, fechacreacion, tipo);
    end pCreatesolicitud;
    
    --function para leer solicitud por codigo
    function fReadsolicitudcodigo(Ecodigo in solicitud.codigo%type) return solicitud%rowtype is
    rc solicitud%rowtype;
    begin
        select * into rc
        from solicitud
        where solicitud.codigo = Ecodigo;
        return rc;
    end fReadsolicitudcodigo;
    
    --function para leer solicitud por cedula cliente
    function fReadsolicitudclientecedula(Eclientecedula in solicitud.clientecedula%type) return solicitud%rowtype is
    rc solicitud%rowtype;
    begin
        select * into rc
        from solicitud
        where solicitud.clientecedula = Eclientecedula;
        return rc;
    end fReadsolicitudclientecedula;
    
    --function para leer solicitud por producto codigo
    function fReadsolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type) return solicitud%rowtype is
    rc solicitud%rowtype;
    begin
        select * into rc
        from solicitud
        where solicitud.productocodigo = Eproductocodigo;
        return rc;
    end fReadsolicitudproductocodigo;
    
    --procedure para actualizar solicitud
    procedure pUpdatesolicitudcodigo(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type) is
    begin
        update solicitud
        set estado = Eestado, descripcion = Edescripcion, clientecedula = Eclientecedula, productocodigo = Eproductocodigo, fechacreacion = Efechacreacion, tipo = Etipo
        where solicitud.codigo = Ecodigo;
    end pUpdatesolicitudcodigo;
    
    --procedure para actualizar solicitud por cedula cliente
    procedure pUpdatesolicitudclientecedula(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type) is
    begin
        update solicitud
        set estado = Eestado, descripcion = Edescripcion, codigo = Ecodigo, productocodigo = Eproductocodigo, fechacreacion = Efechacreacion, tipo = Etipo
        where solicitud.clientecedula = Eclientecedula;
    end pUpdatesolicitudclientecedula;
    
    --procedure para actualizar solicitud por codigo producto
    procedure pUpdatesolicitudcodigoproducto(Ecodigo in solicitud.codigo%type, Eestado in solicitud.estado%type, Edescripcion in solicitud.descripcion%type, Eclientecedula in solicitud.clientecedula%type, Eproductocodigo in solicitud.productocodigo%type, Efechacreacion in solicitud.fechacreacion%type, Etipo in solicitud.tipo%type) is
    begin
        update solicitud
        set estado = Eestado, descripcion = Edescripcion, clientecedula = Eclientecedula, codigo = Ecodigo, fechacreacion = Efechacreacion, tipo = Etipo
        where solicitud.productocodigo = Eproductocodigo;
    end pUpdatesolicitudcodigoproducto;
    
    --procedure para borrar asignacion por codigo
    procedure pDeletesolicitudcodigo(Ecodigo in solicitud.codigo%type) is
    begin
        delete from solicitud
        where solicitud.codigo = Ecodigo;
    end pDeletesolicitudcodigo;
    
    --procedure para borrar asignacion por cedula cliente
    procedure pDeletesolicitudClientecedula(Eclientecedula in solicitud.clientecedula%type) is
    begin
        delete from solicitud
        where solicitud.clientecedula = Eclientecedula;
    end pDeletesolicitudClientecedula;
    
    --procedure para borrar asignacion por codigo producto
    procedure pDeletesolicitudproductocodigo(Eproductocodigo in solicitud.productocodigo%type) is
    begin
        delete from solicitud
        where solicitud.productocodigo = Eproductocodigo;
    end pDeletesolicitudproductocodigo;
    
end pksolicitud;

--package of solicitudmodificacion
create or replace package pksolicitudmodificacion is
    procedure pCreatesolicitudmodificacion(solicitudcodigo in solicitudmodificacion.solicitudcodigo%type, productocodigo in solicitudmodificacion.productocodigo%type);
    function fReadsolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type) return solicitudmodificacion%rowtype;
    function fReadsolicitudmodificacionprodutocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type) return solicitudmodificacion%rowtype;
    procedure pUpdatesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type);
    procedure pUpdatesolicitudmodificacionproductocodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type);
    procedure pDeletesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type);
    procedure pDeletesolicitudmodificacionproductocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type);
end pksolicitudmodificacion;

create or replace package body pksolicitudmodificacion is
    --procedure para añadir solicitudmodificacion
    procedure pCreatesolicitudmodificacion(solicitudcodigo in solicitudmodificacion.solicitudcodigo%type, productocodigo in solicitudmodificacion.productocodigo%type) is
    begin
        insert into solicitudmodificacion values (solicitudcodigo, productocodigo);
    end pCreatesolicitudmodificacion;
    
    --function para leer solicitud modificacion por solicitud codigo
    function fReadsolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type) return solicitudmodificacion%rowtype is
    rc solicitudmodificacion%rowtype;
    begin
        select * into rc
        from solicitudmodificacion
        where solicitudmodificacion.solicitudcodigo = Esolicitudcodigo;
        return rc;
    end fReadsolicitudmodificacionsolicitudcodigo;
    
    --function para leer solicitud modificacion por producto codigo
    function fReadsolicitudmodificacionprodutocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type) return solicitudmodificacion%rowtype is
    rc solicitudmodificacion%rowtype;
    begin
        select * into rc
        from solicitudmodificacion
        where solicitudmodificacion.productocodigo = Eproductocodigo;
        return rc;
    end fReadsolicitudmodificacionprodutocodigo;
    
    --procedure para actualizar solicitudmodificacion por solicitud codigo
    procedure pUpdatesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type) is
    begin
        update solicitudmodificacion
        set productocodigo = Eproductocodigo
        where solicitudmodificacion.solicitudcodigo = Esolicitudcodigo;
    end pUpdatesolicitudmodificacionsolicitudcodigo;
    
    --procedure para actualizar solicitudmodificacion por producto codigo
    procedure pUpdatesolicitudmodificacionproductocodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type, Eproductocodigo in solicitudmodificacion.productocodigo%type) is
    begin
        update solicitudmodificacion
        set solicitudcodigo = Esolicitudcodigo
        where solicitudmodificacion.productocodigo = Eproductocodigo;
    end pUpdatesolicitudmodificacionproductocodigo;
    
    --procedure para borrar asignacion por solicitud codigo
    procedure pDeletesolicitudmodificacionsolicitudcodigo(Esolicitudcodigo in solicitudmodificacion.solicitudcodigo%type) is
    begin
        delete from solicitudmodificacion
        where solicitudmodificacion.solicitudcodigo = Esolicitudcodigo;
    end pDeletesolicitudmodificacionsolicitudcodigo;
    
    --procedure para borrar asignacion por producto codigo
    procedure pDeletesolicitudmodificacionproductocodigo(Eproductocodigo in solicitudmodificacion.productocodigo%type) is
    begin
        delete from solicitudmodificacion
        where solicitudmodificacion.productocodigo = Eproductocodigo;
    end pDeletesolicitudmodificacionproductocodigo;
    
end pksolicitudmodificacion;

--package of solicitudreportedanio
create or replace package pksolicitudreportedanio is
    procedure pCreatesolicitudreportedanio(solicitudcodigo in solicitudreportedanio.solicitudcodigo%type, anomaliaid in solicitudreportedanio.anomaliaid%type);
    function fReadsolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type) return solicitudreportedanio%rowtype;
    function fReadsolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type) return solicitudreportedanio%rowtype;
    procedure pUpdatesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type);
    procedure pUpdatesolicitudreportedanioanomaliaid(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type);
    procedure pDeletesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type);
    procedure pDeletesolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type);
end pksolicitudreportedanio;

create or replace package body pksolicitudreportedanio is
    --procedure para añadir solicitudreportedanio
    procedure pCreatesolicitudreportedanio(solicitudcodigo in solicitudreportedanio.solicitudcodigo%type, anomaliaid in solicitudreportedanio.anomaliaid%type) is
    begin
        insert into solicitudreportedanio values (solicitudcodigo, anomaliaid);
    end pCreatesolicitudreportedanio;
    
    --function para leer solicitud reporte danio por solicitud codigo
    function fReadsolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type) return solicitudreportedanio%rowtype is
    rc solicitudreportedanio%rowtype;
    begin
        select * into rc
        from solicitudreportedanio
        where solicitudreportedanio.solicitudcodigo = Esolicitudcodigo;
        return rc;
    end fReadsolicitudreportedaniosolicitudcodigo;

    --function para leer solicitud reporte danio anomalia id
    function fReadsolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type) return solicitudreportedanio%rowtype is
    rc solicitudreportedanio%rowtype;
    begin
        select * into rc
        from solicitudreportedanio
        where solicitudreportedanio.anomaliaid = Eanomaliaid;
        return rc;
    end fReadsolicitudreportedanioanomaliaid;
    
    --procedure para actualizar solicitudreportedanio por solicitud codigo
    procedure pUpdatesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type) is
    begin
        update solicitudreportedanio
        set solicitudcodigo = Esolicitudcodigo
        where solicitudreportedanio.anomaliaid = Eanomaliaid;
    end pUpdatesolicitudreportedaniosolicitudcodigo;
    
    --procedure para actualizar solicitudreportedanio por anomalia id
    procedure pUpdatesolicitudreportedanioanomaliaid(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type, Eanomaliaid in solicitudreportedanio.anomaliaid%type) is
    begin
        update solicitudreportedanio
        set anomaliaid = Eanomaliaid
        where solicitudreportedanio.solicitudcodigo = Esolicitudcodigo;
    end pUpdatesolicitudreportedanioanomaliaid;
    
    --procedure para borrar asignacion por solicitud codigo
    procedure pDeletesolicitudreportedaniosolicitudcodigo(Esolicitudcodigo in solicitudreportedanio.solicitudcodigo%type) is
    begin
        delete from solicitudreportedanio
        where solicitudreportedanio.solicitudcodigo = Esolicitudcodigo;
    end pDeletesolicitudreportedaniosolicitudcodigo;
    
    --procedure para borrar asignacion por anomalia id
    procedure pDeletesolicitudreportedanioanomaliaid(Eanomaliaid in solicitudreportedanio.anomaliaid%type) is
    begin
        delete from solicitudreportedanio
        where solicitudreportedanio.anomaliaid = Eanomaliaid;
    end pDeletesolicitudreportedanioanomaliaid;
    
end pksolicitudreportedanio;