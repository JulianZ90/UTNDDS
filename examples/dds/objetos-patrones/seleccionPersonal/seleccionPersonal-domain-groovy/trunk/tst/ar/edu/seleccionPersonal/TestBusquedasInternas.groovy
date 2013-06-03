package ar.edu.seleccionPersonal

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestBusquedasInternas {

	PersonalPlanta lopez
	PersonalContratado contratadoDeOtroSector
	PersonalContratado contratadoDeMismoSector
	Externo externo
	BusquedaInterna busquedaProgramador
	Cargo cargoProgramador
	
	@Before
	def void init() {
		busquedaProgramador = new BusquedaInterna(cargo: cargoProgramador, sector: "Sistemas")
		
		cargoProgramador = new Cargo(descripcion: "Programador", sueldo: 6000)
		
		lopez = new PersonalPlanta(cargo: cargoProgramador, sector: "Sistemas")
		contratadoDeOtroSector = new PersonalContratado(cargo: cargoProgramador, sector: "Contabilidad")
		contratadoDeMismoSector = new PersonalContratado(cargo: cargoProgramador, sector: "Sistemas")
	}
	
	@Test
	def void personalDePlantaPuedePostularse() {
		busquedaProgramador.postular(lopez)
		Assert.assertEquals(busquedaProgramador.postulantes, [lopez])
	}

	@Test(expected=UnsupportedOperationException.class)
	def void personalContratadoDeOtroSectorNoPuedePostularse() {
		busquedaProgramador.postular(contratadoDeOtroSector)
	}

	@Test
	def void personalContratadoDeMismoSectorPuedePostularse() {
		busquedaProgramador.postular(contratadoDeMismoSector)
		Assert.assertEquals(busquedaProgramador.postulantes, [contratadoDeMismoSector])
	}

}
