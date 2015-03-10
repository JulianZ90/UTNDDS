package ar.edu.agricultores.venta

class CompradorExtranjero extends Comprador {
	
	static double COEFICIENTE_AJUSTE = 0.4
	
	override coeficienteAjuste(Venta venta) {
		COEFICIENTE_AJUSTE
	}
		
}