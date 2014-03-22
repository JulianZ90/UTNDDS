package ar.edu.agricultores

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set

class ReporteadorAgricultores {
	List<String> cultivos

	def Set<String> cultivos(Agricultor agricultor) {
		cultivos = new ArrayList<String>
		agricultor.parcelas.forEach [parcela|cultivos.addAll(parcela.cultivo.toString)]
		new HashSet(cultivos)
	}

}
