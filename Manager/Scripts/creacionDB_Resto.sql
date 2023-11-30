USE master
GO

CREATE DATABASE Resto
GO

USE Resto
GO

CREATE TABLE Categorias (
  IdCategoria int primary key identity (1,1),
  Descripcion varchar(100) not null
)
GO


CREATE TABLE Menu(
  IdMenu int primary key identity (1,1),
  Descripcion varchar (250) not null,
  Precio decimal(16,2) not null check(Precio > 0),
  IdCategoria int not null FOREIGN key references Categorias (IdCategoria),
  RequiereStock bit not null,
  Stock int null
)
GO

CREATE TABLE EstadoMesa(
  IdEstadoMesa int primary key identity (1,1),
  Descripcion varchar (100)
)

GO
 

CREATE TABLE Perfiles(
  IdPerfil int primary key identity(1,1),
  Descripcion varchar(100)
)
GO


CREATE TABLE Usuarios(
  IdUsuario int primary key identity (1,1),
  Nombre  varchar(250) not null,
  Apellido varchar(250) not null,
  Dni varchar (20) not null unique,
  Contrasenia varchar (150) not null,
  FechaCreacion datetime,
  IdPerfil int not null FOREIGN key references Perfiles (IdPerfil)
)
GO

CREATE TABLE Mesas (
  IdMesa int primary key identity(1,1),
  IdEstado int not null FOREIGN key references EstadoMesa (IdEstadoMesa), 
  IdUsuario int null FOREIGN key REFERENCES Usuarios (IdUsuario)
  
)


GO


CREATE TABLE Pedidos (
  IdPedido int primary key identity (1,1),
  iDMesa int FOREIGN key REFERENCES Mesas (IdMesa),
  IdUsuario int FOREIGN key references Usuarios (IdUsuario),
  FechaCreacion dateTime not null,
  Total decimal null
)
GO

CREATE TABLE DetallePedidos (
  IdDetallePedido int primary key identity (1,1),
  IdPedido int FOREIGN key REFERENCES Pedidos(IdPedido),
  IdMenu int FOREIGN key references Menu(IdMenu)
)
GO

create TABLE Reservas
(
  IdReserva int primary key identity (1,1),
  FechaReserva DATETIME not null,
  NumeroMesa int not null FOREIGN KEY  REFERENCES Mesas (IdMesa),
  dniCliente VARCHAR (10) not null

)

GO


create procedure sp_AltaPerfil
(
  @perfil varchar (100)
)
as 
BEGIN 
  if not exists(select 1 from Perfiles where Descripcion like @perfil )
  begin 
    insert into Perfiles (Descripcion) values (@perfil)
  end
end

go


create procedure sp_Eliminar
(
  @Id int
)
AS
BEGIN 
  DELETE FROM Perfiles WHERE IdPerfil = @Id
END

go

create procedure sp_ListarPerfiles
AS
BEGIN
  select * from Perfiles
END


go 

create procedure sp_ModificarPerfil
(
  @id int,
  @Descripcion varchar(100)
)
as
BEGIN
  update Perfiles set Descripcion = @Descripcion where IdPerfil = @Id
END

GO

CREATE PROCEDURE sp_AgregarUsuario
(
  @Nombre varchar (250),
  @Apellido varchar(250),
  @Dni varchar (20),
  @IdPerfil int
)
as 
BEGIN 
  if not exists(select 1 from Usuarios where Dni like @Dni )
  begin 
 
    insert into Usuarios (Nombre,Apellido,Dni,Contrasenia,FechaCreacion,IdPerfil) 
    values
     (@Nombre,@Apellido,@Dni,@Dni,GETDATE(),@IdPerfil)
  end
end

go

create procedure sp_EliminarUsuario
(
  @Id int
)
AS
BEGIN 
  DELETE FROM Usuarios WHERE IdUsuario = @Id
END


go


create procedure sp_ListarUsuarios
AS
BEGIN
  select u.IdUsuario,
   u.Nombre,
    u.Apellido, 
    u.Dni,
     u.Contrasenia,
      u.FechaCreacion,
       p.IdPerfil, 
       p.Descripcion
        from Usuarios u 
        inner join Perfiles p on u.IdPerfil = p.IdPerfil
END

GO

CREATE procedure sp_ModificarUsuario
(
  @IdUsuario int,
  @Nombre varchar(250),
  @Apellido varchar(250),
  @Dni varchar(20),
  @IdPerfil int

)
as
BEGIN
  update Usuarios
   set  Nombre = @Nombre , 
        Apellido = @Apellido ,
        Dni = @Dni,
        IdPerfil = @IdPerfil 
         
  where IdUsuario = @IdUsuario
END

GO

create procedure sp_ObtenerUsuarioPorId(
  @Id INT
)
AS
BEGIN
  SELECT * FROM Usuarios u
  INNER JOIN Perfiles p on p.IdPerfil = u.IdPerfil
  WHERE IdUsuario = @Id
END

GO


CREATE procedure sp_ModificarContrasenia
(
  @IdUsuario int,
  @Contrasenia varchar (150)
)
as
BEGIN
  update Usuarios
   set  Contrasenia = @Contrasenia
         
  where IdUsuario = @IdUsuario
END

GO


create procedure sp_AgregarCategoria
(
  @Descripcion varchar (100)
)
as 
BEGIN 
  if not exists(select 1 from Categorias where Descripcion like @Descripcion )
  begin 
    insert into Categorias (Descripcion) values (@Descripcion)
  end
end


go


create procedure sp_EliminarCategoria
(
  @IdCategoria int
)
AS
BEGIN 
  DELETE FROM Categorias WHERE IdCategoria = @IdCategoria
END


go


create procedure sp_ListarCategorias
AS
BEGIN
  select * from Categorias
END


GO


create procedure sp_ModificarCategoria
(
  @idCategoria int,
  @Descripcion varchar(100)
)
as
BEGIN
  update Categorias set Descripcion = @Descripcion where IdCategoria = @idCategoria
END


GO


create procedure sp_ObtenerElementoMenuPorId(
  @Id INT
)
AS
BEGIN
  SELECT * FROM Menu m
  INNER JOIN Categorias c  on m.IdCategoria = c.IdCategoria
  WHERE m.IdMenu = @Id
END

GO


create procedure sp_AgregarElementoMenu
(
  @Descripcion varchar (250),
  @Precio decimal (16,2),
  @IdCategoria int,
  @RequiereStock bit,
  @Stock int
)
as 
BEGIN 
  if not exists(select 1 from Menu where Descripcion like @Descripcion )
  begin 
    insert into Menu (Descripcion, Precio, IdCategoria, RequiereStock,Stock) 
    values
     (@Descripcion, @Precio, @IdCategoria, @RequiereStock, @Stock)
  end
end


go


create procedure sp_EliminarElementoMenu
(
  @IdMenu int
)
AS
BEGIN 

  DELETE FROM Menu WHERE IdMenu = @IdMenu

END


go

create procedure sp_ListarElementoMenu(
  @IdCategoria int
)
AS
BEGIN
  select * from Menu where IdCategoria = @IdCategoria
END
 
 GO

create procedure sp_ListarElementoMenuCompleto
AS
BEGIN
  select IdMenu, m.Descripcion, Precio, m.IdCategoria, c.Descripcion as Categoria , RequiereStock, Stock from Menu m 
  inner join Categorias c on m.IdCategoria = c.IdCategoria  
   order by m.IdCategoria asc
END

GO

CREATE procedure sp_ModificarElementoMenu
(
  @IdMenu int,
  @Descripcion varchar(250),
  @Precio decimal (16,2),
   @IdCategoria int,
  @RequiereStock bit,
  @Stock int
)
as
BEGIN
  update Menu set Descripcion = @Descripcion,
                  Precio = @Precio,
                  IdCategoria = @IdCategoria,
                  RequiereStock = @RequiereStock,
                  Stock = @Stock 
   where IdMenu = @IdMenu
END

GO



CREATE PROCEDURE sp_CrearMesa
AS
BEGIN

  DECLARE @idEstadoMesa INT

  SELECT @idEstadoMesa = IdEstadoMesa 
  FROM EstadoMesa
  WHERE Descripcion = 'Libre'

  INSERT INTO Mesas
  VALUES(@idEstadoMesa, NULL, NULL)

END


GO

CREATE PROCEDURE sp_AsignarMesa
(
  @idUsuario INT,
  @idMesa INT
)
AS
BEGIN

    UPDATE Mesas
    SET IdUsuario = @idUsuario
    WHERE Idmesa = @idMesa

END


GO


CREATE PROCEDURE sp_CambiarEstado
(
  @IdMesa int,
  @IdEstado int
)
AS
BEGIN
  UPDATE Mesas
  SET IdEstado = @IdEstado WHERE IdMesa = @IdMesa
END

GO
 
CREATE PROCEDURE sp_EliminarMesa
(
  @IdMesa int
)
AS
BEGIN
    DELETE from Mesas where IdMesa = @IdMesa
END

GO


CREATE PROCEDURE sp_ListarMesas
AS
BEGIN

  SELECT Idmesa, IdEstado, IdUsuario, Descripcion FROM Mesas m 
  inner join EstadoMesa em on m.IdEstado = em.IdEstadoMesa
  
END

GO

CREATE PROCEDURE sp_ObtenerUsuariosPorPerfil(
  @IdPerfil int
)
AS
BEGIN
  SELECT IdUsuario, Nombre, Apellido,Dni, Contrasenia, FechaCreacion,u.IdPerfil, Descripcion FROM Usuarios u
  inner join Perfiles p on u.IdPerfil = P.IdPerfil
  WHERE u.IdPerfil = @IdPerfil 
END

GO

CREATE PROCEDURE sp_DesasignarMesas
AS
BEGIN
  update Mesas 
  set IdUsuario = null
END

GO

CREATE PROCEDURE sp_ListarMesasPorMesero
(
 @IdUsuario int 
)
AS
BEGIN
  SELECT Idmesa, IdEstado, IdUsuario, Descripcion FROM Mesas m 
  inner join EstadoMesa em on m.IdEstado = em.IdEstadoMesa 
  where m.IdUsuario = @IdUsuario 
END


GO

CREATE PROCEDURE sp_DesasignarMesa
(
  @idMesa INT
)
AS
BEGIN
    UPDATE Mesas
    SET IdUsuario = null
    WHERE Idmesa = @idMesa
END


go



CREATE PROCEDURE sp_CrearPedido(
  @IdMesa int,
  @IdUsuario int

)
AS
begin
  insert into Pedidos (iDMesa,IdUsuario,FechaCreacion,Total)
  VALUES(@IdMesa,@IdUsuario,GETDATE(),null)
  select top 1 IdPedido from Pedidos order BY IdPedido DESC
END




GO


CREATE PROCEDURE sp_AgregarAlPedido(
@IdPedido int,
@IdMenu int
)
AS
BEGIN
  INSERT INTO DetallePedidos (IdPedido,IdMenu)
  VALUES(@IdPedido,@IdMenu)
END


GO


CREATE PROCEDURE sp_QuitarDelPedido(
  @IdDetallePedido int
)
AS
BEGIN
  DELETE FROM DetallePedidos WHERE IdDetallePedido = @IdDetallePedido
END


go


CREATE PROCEDURE sp_CerrarPedido(
@IdPedido int
)
AS
BEGIN
declare @total decimal
 select @total = sum(m.Precio) from DetallePedidos dp 
 inner join Menu m on dp.IdMenu = m.IdMenu
 where IdPedido = @IdPedido 

  update Pedidos SET Total = @total WHERE IdPedido = @IdPedido

END

GO


create PROCEDURE sp_ObtenerDetallePedido(
  @IdPedido int
)
AS
BEGIN
  select dp.IdDetallePedido,
   dp.IdMenu, 
   dp.IdPedido, 
   m.Descripcion,
    m.Precio,
    m.RequiereStock,
    m.Stock,
    m.IdCategoria
    from DetallePedidos dp
  inner join Menu m on dp.IdMenu = m.IdMenu 
  where IdPedido = @IdPedido
END

GO


CREATE procedure sp_ObtenerMesaPorId(
@NumeroMesa int
)
AS
BEGIN
 select m.Idmesa, m.IdEstado, em.Descripcion, IdUsuario from Mesas m
 INNER JOIN EstadoMesa em on m.IdEstado = em.IdEstadoMesa
 where Idmesa = @NumeroMesa

END

GO

create PROCEDURE sp_ObtenerPedidoActual(
  @NumeroMesa int
)
AS
BEGIN

  select p.IdPedido from Pedidos p
  inner join Mesas m on p.iDMesa = m.Idmesa
  inner join EstadoMesa em on m.IdEstado = em.IdEstadoMesa
   where p.iDMesa = @NumeroMesa AND em.Descripcion = 'Ocupada'

END


GO

create PROCEDURE sp_ListarIdMeseros
as BEGIN
    select IdUsuario, ( Nombre +' ' + Apellido) AS Nombre from  Usuarios where IdPerfil = 2
end


GO


CREATE PROCEDURE sp_ObtenerFacturacionDelDia(
  @Fecha DATETIME
)
AS
BEGIN
 selecT ISNULL(SUM(Total), 0)as Total from Pedidos where CONVERT(DATE, FechaCreacion) = CONVERT(DATE, @Fecha)
END

GO


CREATE PROCEDURE sp_ObtenerDetallePedidoPorMesero(
  @IdUsuario int
)
AS
BEGIN
  select  
    mn.Descripcion,
    mn.Precio,
    dp.IdPedido 
    from Usuarios u
    inner join Mesas m on u.IdUsuario=m.IdUsuario
    inner join Pedidos p on m.Idmesa=p.iDMesa
    inner join DetallePedidos dp on dp.IdPedido=p.IdPedido
    INNER join Menu mn on mn.IdMenu=dp.IdMenu
  where u.IdUsuario = @IdUsuario
END


GO


CREATE PROCEDURE sp_ListarPedidosPorMesa(
  @IdMesa int
)
AS
BEGIN
  select  
    mn.Descripcion,
    mn.Precio,
    dp.IdPedido 
    from Mesas m
    inner join Pedidos p on m.Idmesa=p.iDMesa
    inner join DetallePedidos dp on dp.IdPedido=p.IdPedido
    INNER join Menu mn on mn.IdMenu=dp.IdMenu
  where m.IdMesa = @IdMesa
END



GO


CREATE TABLE FechasPedidos(
	IdPedido int not null,
	Fecha varchar(12) not null,
	Hora varchar(8) not null,
)
go

create procedure sp_AgregarFechaPedido  (    @IdPedido int,    @Fecha varchar (12), @Hora varchar (8)  )  
as   BEGIN     
insert into FechasPedidos (IdPedido, Fecha, Hora) 
values (@IdPedido, @Fecha, @Hora)  
end
go

create procedure sp_ObtenerPedidosDelDia  (    @Fecha varchar (12)  )  
as   BEGIN      
SELECT IdPedido FROM FechasPedidos 
WHERE Fecha = @Fecha  END


go


create procedure sp_GuardarFechaPedido  (    @IdPedido int ,    @Fecha varchar (12), @Hora varchar (8)  )  
as   BEGIN      
insert into FechasPedidos (IdPedido, Fecha, Hora) values (@IdPedido, @Fecha, @Hora)  end


GO


CREATE PROCEDURE sp_ValidarReserva(
   @NumeroMesa int,
  @FechaReserva DATETIME
)
AS
BEGIN
  select r.NumeroMesa  from Reservas r
  inner join Mesas m ON r.NumeroMesa = m.Idmesa
  WHERE (
         NumeroMesa = @NumeroMesa 
         AND ((@FechaReserva  BETWEEN FechaReserva and DATEADD(HOUR,2,FechaReserva) )
         OR (DATEADD(HOUR,2,@FechaReserva)  BETWEEN FechaReserva and DATEADD(HOUR,2,FechaReserva)))
        )
        OR NumeroMesa = @NumeroMesa and m.IdEstado = 1

END



GO



CREATE PROCEDURE sp_ReservarMesa(
  @FechaReserva DATETIME,
  @NumeroMesa int,
  @dniCliente varchar(10)
)
as
BEGIN
  insert into Reservas (FechaReserva,NumeroMesa,dniCliente) 
  values(@FechaReserva,@NumeroMesa,@dniCliente) 
end


GO


CREATE PROCEDURE sp_ListarReservas
AS
BEGIN
  DECLARE @FechaActual DATE
  set @FechaActual = getdate()

  SELECT  FechaReserva, NumeroMesa, dniCliente FROM Reservas
  where CONVERT(DATE,FechaReserva) = @FechaActual
END


GO


CREATE PROCEDURE sp_CoincideReserva(
   @NumeroMesa int,
  @dniCliente varchar(10)
)
AS
BEGIN

  declare @FechaReserva datetime = getdate()
  select NumeroMesa  from Reservas 
  WHERE NumeroMesa = @NumeroMesa 
  AND (@FechaReserva  BETWEEN FechaReserva and DATEADD(HOUR,2,FechaReserva) )
  and dniCliente = @dniCliente

END

GO


CREATE PROCEDURE sp_ListarStock
AS
BEGIN
 SELECT IdMenu, Descripcion, Stock from Menu 
 where RequiereStock = 1 and Stock < 10

END


go


create procedure sp_BuscarMenu(
    @busqueda varchar (150) 
)  AS  BEGIN    
select *, c.Descripcion AS DescripcionCategoria 
FROM Menu m 
INNER JOIN Categorias c  on m.IdCategoria = c.IdCategoria 
where m.Descripcion 
like '%'+@busqueda+'%' 
END



go



-- INSERTAR DATOS NECESARIOS

 insert into Categorias (IdCategoria,Descripcion)
 VALUES (1,'Comida'),
        (2,'Bebida'),
        (3,'Postre')

GO


insert into EstadoMesa (IdEstadoMesa,Descripcion)
VALUES (1,'Ocupada'),
       (2,'Reservada'),
       (3,'Libre')


 GO


insert into Perfiles (IdPerfil, Descripcion)
VALUES (1,'Gerente'),
       (2,'Mesero')

go
