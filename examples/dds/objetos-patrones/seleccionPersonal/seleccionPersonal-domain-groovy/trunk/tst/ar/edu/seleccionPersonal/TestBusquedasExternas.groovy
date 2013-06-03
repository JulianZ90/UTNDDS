package ar.edu.seleccionPersonal

import org.junit.Assert
import org.junit.Test

class TestBusquedasExternas extends AbstractTestBusquedas {

	@Test(expected=UnsupportedOperationException.class)
	def void personalDePlantaNoPuedePostularse() {
		busquedaProgramadorExterno.postular(lopez)
	}

	@Test(expected=UnsupportedOperationException.class)
	def void personalContratadoDeOtroSectorNoPuedePostularse() {
		busquedaProgramador.postular(contratadoDeOtroSector6Meses)
	}

	@Test
	def void personalContratadoDeMismoSectorPuedePostularse() {
		busquedaProgramador.postular(contratadoDeMismoSector2Anios)
		Assert.assertEquals(busquedaProgramador.postulantes, [contratadoDeMismoSector2Anios])
	}

	@Test
	def void externoPuedePostularse() {
		busquedaProgramadorExterno.postular(externo)
		Assert.assertEquals([externo], busquedaProgramadorExterno.postulantes)
	}

}
