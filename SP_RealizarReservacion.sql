USE [ESeventos]
GO

create procedure SP_RealizarReservacion @numReservacion varchar(10),@fecha date,@hora time(4),@descripcion varchar(40)
as
	Begin
		BEGIN TRY
			Begin transaction
			insert into Reservacion(numReservacion,fecha,hora,descripcion)
			values(@numReservacion,@fecha,@hora,@descripcion)
			commit
		END TRY
		BEGIN CATCH
			declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
			print('ERROR:'+@errorMsg)
		END CATCH
	END