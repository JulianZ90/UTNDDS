package ar.edu.jugadores.home

import ar.edu.jugadores.domain.Jugador
import java.util.List

interface RepoJugadores {
	
	def List<Jugador> getJugadores(JugadorBusqueda jugadorBusqueda)
	
}