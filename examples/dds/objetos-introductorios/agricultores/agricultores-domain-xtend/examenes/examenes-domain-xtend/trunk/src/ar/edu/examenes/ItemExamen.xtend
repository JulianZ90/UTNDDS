package ar.edu.examenes

import java.util.List

abstract class ItemExamen {

	def List<Respuesta> respuestasRespondidas()
	
	def Object valor()
}