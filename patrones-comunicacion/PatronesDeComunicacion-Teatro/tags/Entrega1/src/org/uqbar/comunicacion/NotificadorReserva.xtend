package org.uqbar.comunicacion

import java.util.List
import org.uqbar.comunicacion.Asiento

interface NotificadorReserva {
	def void seReservaronAsientos(List<Asiento> asientosReservados)

	def void lugarInsuficiente(List<Asiento> asientosReservados)

	def void empezoLaFuncion()
}
