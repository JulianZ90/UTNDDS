package ar.edu.agricultores;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ReporteadorAgricultores {

	List<String> cultivos;

	// PUNTO 4
	public Set<String> cultivos(Agricultor agricultor) {
		cultivos = new ArrayList<String>();
		for (Parcela parcela : agricultor.parcelas) {
			cultivos.add(parcela.cultivo.toString());
		}
		return new HashSet<String>(cultivos);
	}

	// PUNTO 5
	public boolean algunaParcelaSubutilizada(Agricultor agricultor) {
		for (Parcela parcela : agricultor.parcelas) {
			if (parcela.hectareasCultivadas / parcela.hectareas < 0.5) {
				return true;
			}
		}
		return false;
	}

}
