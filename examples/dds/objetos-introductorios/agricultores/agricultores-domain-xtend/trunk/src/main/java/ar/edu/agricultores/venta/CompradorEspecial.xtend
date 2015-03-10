package ar.edu.agricultores.venta

import java.util.List
import ar.edu.agricultores.Cultivo
import java.util.ArrayList

class CompradorEspecial extends Comprador {
	
	List<Cultivo> cultivosExentos
	
	new() {
		cultivosExentos = new ArrayList<Cultivo>()
	}
	
	override coeficienteAjuste(Venta venta) {
		if (cultivosExentos.contains(venta.cultivo)) {
			0.1
		} else {
			0
		}
	}
		
}