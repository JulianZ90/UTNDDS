package ar.edu.canjePremios

import ar.edu.canjePremios.excepciones.NoTienePuntosSuficientesException
import ar.edu.canjePremios.excepciones.NoHayStockException

class Cliente {

	var int puntosAcum
	var listaDeseos = newArrayList

	new(int puntos) {
		this.puntosAcum = puntos
	}

	def getListaDeseos() {
		listaDeseos
	}

	def setPuntosAcum(int puntos) {
		this.puntosAcum = puntos
	}

	def getPuntosAcum() {
		this.puntosAcum
	}

	def restarPuntos(Premio unPremio) {
		this.validarPuntosSuficientes(unPremio)
		puntosAcum = puntosAcum - unPremio.valor
	}

	def canjearPremio(Premio unPremio) {

		try {
			unPremio.canjear
		} catch (NoHayStockException e) {

			//manejar la excepcion por una regla de negocio
			this.agregarAListaDeDeseos(unPremio)
		}
		this.restarPuntos(unPremio)
	}

	def private validarPuntosSuficientes(Premio unPremio) {
		if (tienePuntosSuficientesPara(unPremio).operator_not)
			throw new NoTienePuntosSuficientesException("No se tiene suficientes puntos para " + unPremio.descripcion)
	}

	def private tienePuntosSuficientesPara(Premio unPremio) {
		return puntosAcum >= unPremio.valor
	}

	def private agregarAListaDeDeseos(Premio unPremio) {
		listaDeseos.add(unPremio)
	}
}
