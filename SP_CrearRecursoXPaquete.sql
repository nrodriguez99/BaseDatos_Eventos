USE [ESeventos]
GO


create procedure SP_CrearRecursoXPaquete @idRecurso int, @idPaquete int
as
	Begin
		BEGIN TRY
			Begin transaction
				insert into RecursoXPaquete(idRecurso,idPaquete)
				values(@idRecurso,@idPaquete)
			commit
		END TRY
		BEGIN CATCH
			declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
			print('ERROR:'+@errorMsg)
		END CATCH
	END