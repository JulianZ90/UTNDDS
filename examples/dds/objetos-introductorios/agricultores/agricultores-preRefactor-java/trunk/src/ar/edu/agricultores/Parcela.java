package ar.edu.agricultores;

public class Parcela {

	int hectareas;
	Cultivo cultivo;
	int hectareasCultivadas;
	int cantidadEnSilo;
	
	/** GETTERS Y SETTERS */
	public int getHectareas() {
		return hectareas;
	}

	public void setHectareas(int hectareas) {
		this.hectareas = hectareas;
	}

	public Cultivo getCultivo() {
		return cultivo;
	}

	public void setCultivo(Cultivo cultivo) {
		this.cultivo = cultivo;
	}

	public int getHectareasCultivadas() {
		return hectareasCultivadas;
	}

	public void setHectareasCultivadas(int hectareasCultivadas) {
		this.hectareasCultivadas = hectareasCultivadas;
	}

	public int getCantidadEnSilo() {
		return cantidadEnSilo;
	}

	public void setCantidadEnSilo(int cantidadEnSilo) {
		this.cantidadEnSilo = cantidadEnSilo;
	}

	/** CONSTRUCTOR **/
	public Parcela(int pHectareas, Cultivo pCultivo) {
		hectareas = pHectareas;
		hectareasCultivadas = pHectareas; // por default cultivamos todo
		cultivo = pCultivo;
	}

	// PUNTO 1
	public double getCostoTotal() {
		return cultivo.costo(hectareasCultivadas);
	}

	// PUNTO 2
	public double precioVenta() {
		if (cultivo.esSoja()) { // Soja y SojaTransgenica devuelven true
			return ((Soja) cultivo).precioVenta(cultivo.costo(hectareasCultivadas), hectareas, 10d, 0.1, 1000);
		} else {
			double costoConservantes = 0d;
			for (Conservante conservante : cultivo.conservantes) {
				costoConservantes += conservante.precio;
			}
			// en cada parcela guardamos los conservantes,
			// si el cultivo es trigo tiene conservantes
			// si el cultivo es sorgo hay una colección vacía
			return 20 - costoConservantes;
		}
	}

}
