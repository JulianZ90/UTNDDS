package ar.edu.alumnosMockito

import org.junit.Assert
import org.junit.Before
import org.junit.Test

import static org.mockito.Mockito.*

class TestAlumno {

	Alumno marina
	Alumno chotelli
	Curso cursoUnicoAlgo2
	Curso cursoUnicoAlgo3
	Cursada marinaEnAlgoritmos2
	Cursada marinaEnAlgoritmos3
	Cursada chotelliEnAlgoritmos2
	Nota nota2
	Nota nota5
	Nota nota10

	@Before
	def void init() {
		// Definicion de stubs y mocks
		cursoUnicoAlgo2 = mockearCurso(2)
		cursoUnicoAlgo3 = mockearCurso(1)
		
		nota2 = mockearNota(2)
		nota5 = mockearNota(5)
		nota10 = mockearNota(10)
		
		marinaEnAlgoritmos2 = new Cursada(cursoUnicoAlgo2) => [
			rendirParcial(1, nota2)
			rendirParcial(1, nota5)
			rendirParcial(2, nota10)
		]
		marinaEnAlgoritmos3 = new Cursada(cursoUnicoAlgo3) => [
			rendirParcial(1, nota10)
		]
		chotelliEnAlgoritmos2 = new Cursada(cursoUnicoAlgo2) => [
			rendirParcial(1, nota2)
		]
		
		// ***************************************************
		
		marina = new Alumno("Marina Huberman") => [
			cursar(marinaEnAlgoritmos2)
			cursar(marinaEnAlgoritmos3)
		]

		chotelli = new Alumno("Gervasio Chotelli") => [
			cursar(chotelliEnAlgoritmos2)
		]
	}

	/**
	 * Test de Stub: estado
	 */	
	
	@Test
	def void marinaAproboAlgoritmos2() {
		Assert.assertEquals(true, marinaEnAlgoritmos2.aprobo)
	}

	@Test
	def void marinaAproboAlgoritmos3() {
		Assert.assertEquals(true, marinaEnAlgoritmos3.aprobo)
	}

	@Test
	def void chotelliNoAproboAlgoritmos2() {
		Assert.assertEquals(false, chotelliEnAlgoritmos2.aprobo)
	}

	/**
	 * Test de Mock: expectativas
	 */	
	@Test
	def void paraSaberSiMarinaAproboAlgoritmos2HayQueRevisar3NotasEn1Curso() {
		marinaEnAlgoritmos2.aprobo
		verify(cursoUnicoAlgo2, times(1)).cantidadParciales
		verify(nota2, times(1)).aprobo
		verify(nota5, times(1)).aprobo
		verify(nota10, times(1)).aprobo
	}
	
	@Test
	def void paraSaberSiMarinaAproboAlgoritmos2DelegamosBienEnClaseNota() {
		marinaEnAlgoritmos2.aprobo
		verify(nota2, never()).nota
	}

	@Test
	def void paraSaberSiMarinaAproboAlgoritmos2NoUsamosElMensajeNotasDeNota() {
		marinaEnAlgoritmos2.aprobo
		// TODO: mirar verify(any(typeof(Nota)), never()).nota
	} 
	
	@Test
	def void chotelliApruebaAlgoritmos2ConUnPocoDeAyuda() {
		val Cursada cursadaBuenaChotelli = spy(chotelliEnAlgoritmos2)
		// cuando me pregunten por chotelli en Algoritmos 2
		// le digo que aprobo
		doReturn(true).when(cursadaBuenaChotelli).aprobo
		Assert.assertTrue(cursadaBuenaChotelli.aprobo)
		// Probamos que nunca se pregunto "posta" si chotelli aprobo Algoritmos 2
		verify(nota2, never()).aprobo
	}

	def mockearCurso(int cantidadParciales) {
		val cursoTemp = mock(typeof(Curso))
		when(cursoTemp.cantidadParciales).thenReturn(cantidadParciales)
		cursoTemp
	}
	
	def mockearNota(int nota) {
		val notaTemp = mock(typeof(Nota))
		when(notaTemp.nota).thenReturn(nota)
		when(notaTemp.aprobo).thenReturn(nota >= 4)
		notaTemp
	}
	
}
