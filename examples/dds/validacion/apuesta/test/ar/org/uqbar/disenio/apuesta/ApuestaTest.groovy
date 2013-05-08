package ar.org.uqbar.disenio.apuesta

import static org.mockito.Mockito.*
import static org.junit.Assert.*

import org.junit.Before;
import org.junit.Test;

class ApuestaTest {
	
	def apuesta;
	def dadoMock;
	
	@Before
	void osetUp() {
		apuesta = new Apuesta();
		dadoMock = mock(Dado.class);
		when(dadoMock.tirar())
			.thenReturn(4)
			.thenReturn(6)
			.thenReturn(1);
		apuesta.dado = dadoMock;
	}
	
	@Test
	void gana1Vez() {
		assertEquals(1, apuesta.apostar([1,6,2]));
	}
	@Test
	void pierdeTodo() {
		assertEquals(0, apuesta.apostar([1,4,2]));
	}
	@Test
	void ganaLos3() {
		assertEquals(3, apuesta.apostar([4,6,1]));
	}
}
