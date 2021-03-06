USE [ESeventos]
GO

create procedure SP_RegistrarPaquete @idRecurso int, @nombre varchar(50), @precio money
as
	Begin
		BEGIN TRY
			Begin transaction
				insert into Paquete(nombre,precio)
				values(@nombre,@precio)
				declare @idPaquete int;
				Set @idPaquete =(SELECT max(idPaquete) FROM Paquete);
				exec SP_CrearRecursoXPaquete @idRecurso, @idPaquete
			commit
		END TRY
		BEGIN CATCH
			declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
			print('ERROR:'+@errorMsg)
		END CATCH
	END
