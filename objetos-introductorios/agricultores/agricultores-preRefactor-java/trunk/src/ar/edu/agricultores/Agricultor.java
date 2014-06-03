package ar.edu.agricultores;

import java.util.ArrayList;
import java.util.List;

public class Agricultor {

	List<Parcela> parcelas;
	
	public List<Parcela> getParcelas() {
		return parcelas;
	}

	public void setParcelas(List<Parcela> parcelas) {
		this.parcelas = parcelas;
	}

	public Agricultor() {
		parcelas = new ArrayList<Parcela>();
	}
	
	public void agregarParcela(Parcela parcela) {
		parcelas.add(parcela);
	}	

}
