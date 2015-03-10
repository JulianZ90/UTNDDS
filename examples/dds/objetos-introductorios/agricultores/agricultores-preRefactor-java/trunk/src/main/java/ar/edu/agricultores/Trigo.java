package ar.edu.agricultores;

public class Trigo extends Cultivo {

	@Override 
	public String toString() {
		return "Trigo";
	}
	
	public void agregarConservante(Conservante conservante) {
		conservantes.add(conservante);
	}

	// PUNTO 1
	@Override 
	public double costo(int cantidadHectareasCultivadas) {
		if (cantidadHectareasCultivadas * 5 > 500) {
			return 500d;
		} else {
			return cantidadHectareasCultivadas * 5;
		}
	}

}
