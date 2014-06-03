package ar.edu.agricultores;

public class SojaTransgenica extends Soja {

	boolean puedeSufrirMutaciones;

	public SojaTransgenica(boolean pPuedeSufrirMutaciones) {
		puedeSufrirMutaciones = pPuedeSufrirMutaciones;
	}

	@Override
	public String toString() {
		return "Soja Transgenica";
	}

	// PUNTO 1
	// super.costo(cantidadHectareasCultivadas)  
	// No es un code smell “de libro”, pero uno lo ve en PDP
	@Override 
	public double costo(int cantidadHectareasCultivadas) {
		return 10 * cantidadHectareasCultivadas;
	}

	// PUNTO 2
	@Override 
	public double precioVenta(double costoTotal, int totalHectareas, double efecto, double retencion, int topeHectareas) {
		double retencionPosta = 0d;
		if (totalHectareas > topeHectareas) {
			retencionPosta = retencion;
		}
		double aux = (costoTotal * efecto) * (1 - retencionPosta);
		if (puedeSufrirMutaciones) {
			return aux * 0.5;
		} else {
			return aux;
		}
	}
	
}
