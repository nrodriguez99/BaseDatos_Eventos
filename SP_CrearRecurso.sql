USE [ESeventos]
GO

create procedure SP_CrearRecurs @nombre varchar(30),@correo varchar(50),@telefono varchar(30),@provincia varchar(30),@tipoRecurso varchar(20)
as
	Begin
		BEGIN TRY
			Begin transaction
			insert into Recurso(nombre,correo,telefono,provincia,tipoRecurso)
			values(@nombre,@correo,@telefono,@provincia,@tipoRecurso)
			commit
		END TRY
		BEGIN CATCH
			declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
			print('ERROR:'+@errorMsg)
		END CATCH
	END
