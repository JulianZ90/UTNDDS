package ar.edu.agricultores

class Soja extends Cultivo {

	override String toString() {
		"Soja"
	}

	override costo(int cantidadHectareasCultivadas) {
		10 * cantidadHectareasCultivadas
	}

	override boolean esSoja() {
		true
	}

	def double precioVenta(double costoTotal, int totalHectareas, double efecto, double retencion, int topeHectareas) {
		var retencionPosta = 0d
		if (totalHectareas > topeHectareas) {
			retencionPosta = retencion
		}
		println("Tope: " + topeHectareas)
		println("Total has: " + totalHectareas)
		println("Costo por ha: " + costoTotal)
		println("Retencion posta: " + retencionPosta)
		println("Efecto: " + efecto)
		(costoTotal * efecto) * (1 - retencionPosta)
	}

}
