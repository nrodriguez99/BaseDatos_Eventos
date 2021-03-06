USE [ESeventos]
GO


create procedure SP_Historial_Reservaciones_Local
as
	Begin
		BEGIN TRY
			select R.numReservacion,R.fecha,R.hora,R.descripcion, A.tipoRecurso, cliente.usuario
			from Reservacion R
			inner join ReservacionXRecurso B
			ON R.idReservacion = B.idReservacion
			inner join ClienteXReservacion C
			on C.idReservacion = B.idReservacion
			inner join Cliente cliente
			on C.idCliente = cliente.idCliente
			inner join Recurso A
			on A.idRecurso = B.idRecurso
			where A.tipoRecurso = 'local' ;
		END TRY
		BEGIN CATCH
			declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
			print('ERROR:'+@errorMsg)
		END CATCH
	END
