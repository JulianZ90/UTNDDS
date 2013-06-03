package ar.edu.seleccionPersonal

import org.junit.Before;

class AbstractTestBusquedas {

	PersonalPlanta lopez
	PersonalContratado contratadoDeOtroSector6Meses
	PersonalContratado contratadoDeMismoSector2Anios
	Externo externo
	BusquedaInterna busquedaProgramador
	BusquedaExterna busquedaProgramadorExterno
	Cargo cargoProgramador

	@Before
	def void init() {
		busquedaProgramador = new BusquedaInterna(cargo: cargoProgramador, sector: "Sistemas")
		busquedaProgramadorExterno = new BusquedaExterna(cargo: cargoProgramador, sector: "Sistemas")

		cargoProgramador = new Cargo(descripcion: "Programador", sueldo: 6000)

		lopez = new PersonalPlanta(cargo: cargoProgramador, sector: "Sistemas")
		use (groovy.time.TimeCategory) {
			contratadoDeOtroSector6Meses = new PersonalContratado(fechaIngreso: new Date() - 6.months, cargo: cargoProgramador, sector: "Contabilidad")
			contratadoDeMismoSector2Anios = new PersonalContratado(fechaIngreso: new Date() - 2.years, cargo: cargoProgramador, sector: "Sistemas")
		}
		externo = new Externo()
	}
}
