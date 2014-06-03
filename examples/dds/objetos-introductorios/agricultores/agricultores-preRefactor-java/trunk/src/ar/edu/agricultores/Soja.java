package ar.edu.agricultores;

public class Soja extends Cultivo {

	@Override
	public String toString() {
		return "Soja";
	}

	// PUNTO 1
	@Override
	public double costo(int cantidadHectareasCultivadas) {
		return 10 * cantidadHectareasCultivadas;
	}

	// PUNTO 2
	@Override
	public boolean esSoja() {
		return true;
	}

	public double precioVenta(double costoTotal, int totalHectareas, double efecto, double retencion, int topeHectareas) {
		double retencionPosta = 0d;
		if (totalHectareas > topeHectareas) {
			retencionPosta = retencion;
		}
		return (costoTotal * efecto) * (1 - retencionPosta);
	}

}
