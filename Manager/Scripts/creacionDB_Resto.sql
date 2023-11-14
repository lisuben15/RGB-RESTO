use master
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
  FechaReserva datetime null, 
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

create procedure sp_AgregarUsuario
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

go

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


create procedure sp_ModificarElementoMenu
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
                  RequiereStock = @RequiereStock
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

  SELECT Idmesa, IdEstado, FechaReserva, IdUsuario, Descripcion FROM Mesas m 
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