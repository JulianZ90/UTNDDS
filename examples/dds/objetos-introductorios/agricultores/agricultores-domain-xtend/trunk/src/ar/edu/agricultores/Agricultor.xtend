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
	
	/** Otra opción es que cultivos devuelva un Set<String> y mapeemos 
	 * parcela.cultivo.toString()
	 */
	def Set<Cultivo> cultivos() {
		new HashSet(parcelas.map([ parcela | parcela.cultivo ]))
	}

	def void agregarParcela(Parcela parcela) {
		parcelas.add(parcela)
	}
	
	def algunaParcelaSubutilizada() {
		parcelas.exists [ parcela | parcela.estaSubutilizada ]
	}
	
}


