package ar.edu.jugadores.repo

import ar.edu.jugadores.domain.Equipo
import ar.edu.jugadores.domain.Jugador
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestPartidos {

	ar.edu.jugadores.repo.RepoPartidos homePartidos
	Equipo boca
	Equipo independiente
	Jugador palermo

	@Before
	def void setUp() {
		palermo = new Jugador("Palermo") 
		homePartidos = new ar.edu.jugadores.repo.RepoJDBCPartidos
		boca = new Equipo(1, "Boca")
		independiente = new Equipo(2, "Independiente")
	}

	@Test
	def void ganadorBoca2Independiente0() {
		val partido = homePartidos.getResultado(boca, independiente)
		Assert.assertEquals(boca, partido.ganador)
	}

	@Test
	def void palermoJugoParaBocaEnBoca2Independiente0() {
		val partido = homePartidos.getPartido(boca, independiente)
		Assert.assertTrue(partido.formacionLocal.jugadores.contains(palermo))
	}
		
}