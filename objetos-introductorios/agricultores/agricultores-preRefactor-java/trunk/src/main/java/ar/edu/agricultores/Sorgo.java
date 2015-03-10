package ar.edu.agricultores;

public class Sorgo extends Cultivo {

	@Override 
	public String toString() {
		return "Sorgo";
	}

	// PUNTO 1
	@Override
	public double costo(int cantidadHectareasCultivadas) {
		if (cantidadHectareasCultivadas < 50) {
			return 3 * cantidadHectareasCultivadas;
		} else {
			return 2 * cantidadHectareasCultivadas;
		}
	}

}
