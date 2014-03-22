package ar.edu.agricultores

import java.util.ArrayList
import java.util.List

class Agricultor {
	
	@Property List<Parcela> parcelas
	
	new() {
		parcelas = new ArrayList<Parcela>()
	}
	
	def void agregarParcela(Parcela parcela) {
		parcelas.add(parcela)
	}	
}


