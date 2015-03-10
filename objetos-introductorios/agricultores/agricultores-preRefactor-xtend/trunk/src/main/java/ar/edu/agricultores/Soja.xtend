package ar.edu.agricultores

class Soja extends Cultivo {

	override String toString() {
		"Soja"
	}

	// PUNTO 1
	override costo(int cantidadHectareasCultivadas) {
		10 * cantidadHectareasCultivadas
	}

	// PUNTO 2
	override boolean esSoja() {
		true
	}

	def double precioVenta(double costoTotal, int totalHectareas, double efecto, double retencion, int topeHectareas) {
		var retencionPosta = 0d
		if (totalHectareas > topeHectareas) {
			retencionPosta = retencion
		}
		(costoTotal * efecto) * (1 - retencionPosta)
	}

}
