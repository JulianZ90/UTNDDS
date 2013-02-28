package ar.edu.examenes

import org.junit.Test
import org.junit.Before
import org.junit.Assert
import ar.edu.examenes.ItemExamenMultiple

class TestRespuestaNumerica {
	
	PreguntaNumerica nacimientoYPF
	PreguntaMultipleChoice cargosCafiero
	
	ItemExamenMultiple respuestaCafiero
	
	@Before
	def init() {
		nacimientoYPF = new PreguntaNumerica
		nacimientoYPF.descripcion = "¿En qué año se originó YPF?"
		nacimientoYPF.respuesta = new Respuesta(1922)
		
		cargosCafiero = new PreguntaMultipleChoice
		cargosCafiero.descripcion = "¿cuáles de los siguientes puestos ocupó Antonio Cafiero en el gobierno?"
		cargosCafiero.agregarRespuestaCorrecta(new Respuesta("a"))
		cargosCafiero.agregarRespuestaCorrecta(new Respuesta("c"))
		cargosCafiero.agregarRespuestaCorrecta(new Respuesta("d"))
		
		respuestaCafiero = new ItemExamenMultiple
		respuestaCafiero.agregarRespuesta(new Respuesta("a"))
		respuestaCafiero.agregarRespuesta(new Respuesta("c"))
		respuestaCafiero.agregarRespuesta(new Respuesta("d"))
	}
	
	@Test
	def responderAnioNacimientoYPFOk() {
		Assert::assertTrue("No es correcta la respuesta " + nacimientoYPF, nacimientoYPF.bienRespondida(new ItemExamenSimple(1922)))
	}
	
	@Test
	def responderAnioNacimientoYPFIncorrecta() {
		Assert::assertFalse("No es correcta la respuesta para " + nacimientoYPF, nacimientoYPF.bienRespondida(new ItemExamenSimple(1923)))
	}
	
	@Test
	def responderCargosCafiero() {
		Assert::assertTrue("No es correcta la respuesta para " + cargosCafiero, cargosCafiero.bienRespondida(respuestaCafiero))
	}

}