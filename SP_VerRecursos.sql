USE [ESeventos]
GO


create procedure SP_VerRecursos
as
	Begin
		BEGIN TRY
			select R.idRecurso ,R.nombre, R.correo, R.telefono, R.provincia, R.tipoRecurso
			from Recurso R
		END TRY
		BEGIN CATCH
			declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
			print('ERROR:'+@errorMsg)
		END CATCH
	END
