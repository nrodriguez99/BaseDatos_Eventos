USE [ESeventos]
GO

create procedure SP_Login_Cliente
	@usuario varchar(20),
	@password varchar(30)
as
begin
	DECLARE @temporal int
	DECLARE @resultado int
	set @resultado = 1
	set @temporal = (select a.idCliente from Cliente a where a.usuario = @usuario and @password = a.contrasena)
	if(@temporal is null)
	begin
	set @resultado = 0
	end
	SELECT @resultado
end