package ar.edu.jugadores.repo

import ar.edu.jugadores.domain.Equipo
import ar.edu.jugadores.domain.Partido

interface RepoPartidos {
	
	def Partido getPartido(Equipo equipo1, Equipo equipo2)
	def Partido getResultado(Equipo equipo1, Equipo equipo2)
	
}