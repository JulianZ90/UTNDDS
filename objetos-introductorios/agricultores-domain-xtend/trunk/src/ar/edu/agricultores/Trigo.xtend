package ar.edu.agricultores

import ar.edu.agricultores.Cultivo
import ar.edu.agricultores.Parcela
import java.util.List
import java.util.ArrayList

class Trigo extends Cultivo {

	List<Conservante> conservantes

	new() {
		conservantes = new ArrayList<Conservante>()	
	}	
	
	override double costoPara(Parcela parcela) {
		super.costoPara(parcela).min(500)
	}
	
	override costoBasePorHectarea(Parcela parcela) {
		5
	}
	
	// Extension method que muestra cómo puedo enviar un mensaje min a un número
	def double min(double numero1, double numero2) { 
		if (numero1 < numero2) {
			numero1
		} else {
			numero2
		}
	}
	

	override precioVentaPorKg(Parcela parcela) {
		super.precioVentaPorKg(parcela) - this.costoConservantes
	}
	
	def void agregarConservante(Conservante conservante) {
		conservantes.add(conservante)	
	}
	
	def double costoConservantes() { 
		conservantes.fold(0.0, [ acum, conservante | acum + conservante.precio ])
	}

}