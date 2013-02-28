package ar.edu.agricultores

import ar.edu.agricultores.Cultivo
import ar.edu.agricultores.Parcela
import java.util.List
import java.util.ArrayList
import static extension util.NumberUtil.*

class Trigo extends Cultivo {

	List<Conservante> conservantes

	new() {
		conservantes = new ArrayList<Conservante>()	
	}	
	
	override double costoPara(Parcela parcela) {
		// Uso del extension method
		// se envía un mensaje min a un double !
		super.costoPara(parcela).min(500)
	}
	
	override costoBasePorHectarea(Parcela parcela) {
		5
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