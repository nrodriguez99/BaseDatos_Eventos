USE [ESeventos]
GO

create procedure SP_CrearCliente
	@usuario varchar(20),
	@correo varchar(40),
	@cedula varchar(20),
	@contrasena varchar(30)
as
begin
	insert into Cliente(usuario,correo,cedula,contrasena)
	values(@usuario,@correo,@cedula,@contrasena);
end