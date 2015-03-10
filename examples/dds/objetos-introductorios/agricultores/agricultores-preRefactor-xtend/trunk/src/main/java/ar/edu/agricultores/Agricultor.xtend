package ar.edu.agricultores

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Agricultor {
	
	List<Parcela> parcelas
	
	new() {
		parcelas = new ArrayList<Parcela>()
	}
	
	def void agregarParcela(Parcela parcela) {
		parcelas.add(parcela)
	}	
}


