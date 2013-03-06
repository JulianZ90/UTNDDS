package ar.edu.agricultores

import java.util.List
import java.util.ArrayList
import java.util.HashSet
import java.util.Set

class Agricultor {
	
	List<Parcela> parcelas
	
	new() {
		parcelas = new ArrayList<Parcela>()
	}
	
	def Set<Cultivo> cultivos() {
		new HashSet(parcelas.map([ parcela | parcela.cultivo ]))
	}

	def void agregarParcela(Parcela parcela) {
		parcelas.add(parcela)
	}	
}