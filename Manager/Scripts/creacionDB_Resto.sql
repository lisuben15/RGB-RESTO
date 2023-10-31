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
  Precio decimal not null check(Precio > 0),
  IdCategoria int not null FOREIGN key references Categorias (IdCategoria),
  RequiereStock bit not null,
  Stock int null
)
GO

CREATE TABLE EstadoMesa(
  IdMesa int primary key identity (1,1),
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
  Idmesa int primary key identity(1,1),
  IdEstado int not null FOREIGN key references EstadoMesa (IdMesa),
  FechaReserva datetime, 
  IdUsuario int FOREIGN key REFERENCES Usuarios (IdUsuario)

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
  @Contrasenia varchar(150),
  @IdPerfil int
)
as 
BEGIN 
  if not exists(select 1 from Usuarios where Dni like @Dni )
  begin 
 
    insert into Usuarios (Nombre,Apellido,Dni,Contrasenia,FechaCreacion,IdPerfil) 
    values
     (@Nombre,@Apellido,@Dni,@Contrasenia,GETDATE(),@IdPerfil)
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
  select u.IdUsuario, u.Nombre, u.Apellido, u.Dni, u.Contrasenia, u.FechaCreacion, p.IdPerfil, p.Descripcion from Usuarios u inner join Perfiles p on u.IdPerfil = p.IdPerfil
END

GO

create procedure sp_ModificarUsuario
(
  @IdUsuario int,
  @Nombre varchar(250),
  @Apellido varchar(250),
  @Dni varchar(20),
  @Contrasenia varchar(150),
  @FechaCreacion datetime,
  @IdPerfil int

)
as
BEGIN
  update Usuarios
   set  Nombre = @Nombre , 
        Apellido = @Apellido ,
        Dni = @Dni , 
        Contrasenia = @Contrasenia ,
        FechaCreacion = @FechaCreacion ,
        IdPerfil = @IdPerfil 
         
  where IdUsuario = @IdUsuario
END

GO

