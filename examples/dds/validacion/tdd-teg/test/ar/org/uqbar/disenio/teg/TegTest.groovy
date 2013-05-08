package ar.org.uqbar.disenio.teg

import static org.mockito.Mockito.*
import static org.junit.Assert.*

import org.junit.Before;
import org.junit.Test;

import ar.org.uqbar.disenio.teg.Dado;
import ar.org.uqbar.disenio.teg.Pais;

class TegTest {
	
	def china;
	def kamchatka;
	def dadoChinaMock;
	def dadoKamchatkaMock;
	
	@Before
	void setUp() {
		dadoChinaMock = mock(Dado.class)
		when(dadoChinaMock.tirar()).thenReturn(3).thenReturn(6)thenReturn(1)
		china = new Pais(fichas:4, dado:dadoChinaMock);		

		dadoKamchatkaMock = mock(Dado.class)
		when(dadoKamchatkaMock.tirar()).thenReturn(5).thenReturn(2)thenReturn(2)
		kamchatka = new Pais(fichas:3, dado:dadoKamchatkaMock);

	}
	
	@Test
	void gana2YPierte1() {
		china.ataca(kamchatka);
		assertEquals(3, china.fichas);
		assertEquals(1, kamchatka.fichas);
	}
	
	//TODO probar distintas cantidades de fichas entre atacante y defensor
	
}
