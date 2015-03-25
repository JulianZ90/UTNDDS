package ar.edu.agricultores;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class ReporteadorAgricultores {

	List<String> cultivos;

	// PUNTO 4
	public Set<String> cultivos(Agricultor agricultor) {
		cultivos = agricultor.parcelas
				.stream()
				.map(parcela -> parcela.cultivo.toString())
				.collect(Collectors.toList());
		
		return new HashSet<String>(cultivos);
	}

	// PUNTO 5
	public boolean algunaParcelaSubutilizada(Agricultor agricultor) {
		return agricultor.parcelas
				.stream()
				.anyMatch(parcela -> parcela.hectareasCultivadas / parcela.hectareas < 0.5);
	}

}
