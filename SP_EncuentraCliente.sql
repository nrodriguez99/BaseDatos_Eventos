USE [ESeventos]
GO

create procedure SP_EncuentraCliente
	@usuario varchar(20),
	@password varchar(30)
as
begin
	DECLARE @idCliente int
	DECLARE @temporal int
	select a.idCliente from Cliente a where a.usuario = @usuario and @password = a.contrasena
	
end