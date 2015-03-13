package ar.edu.seleccionPersonal

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestBusquedasInternas extends AbstractTestBusquedas {

	@Test
	def void personalDePlantaPuedePostularse() {
		busquedaProgramador.postular(lopez)
		Assert.assertEquals([lopez], busquedaProgramador.postulantes)
	}

	@Test(expected=UnsupportedOperationException.class)
	def void personalContratadoDeOtroSectorNoPuedePostularse() {
		busquedaProgramador.postular(contratadoDeOtroSector6Meses)
	}

	@Test
	def void personalContratadoDeMismoSectorPuedePostularse() {
		busquedaProgramador.postular(contratadoDeMismoSector2Anios)
		Assert.assertEquals([contratadoDeMismoSector2Anios], busquedaProgramador.postulantes)
	}

	@Test(expected=UnsupportedOperationException.class)
	def void externoNoPuedePostularse() {
		busquedaProgramador.postular(externo)
	}

}
