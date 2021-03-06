package ar.edu.design.examples.microprocesador.domain.instrucciones;

import java.util.List;

import ar.edu.design.examples.microprocesador.domain.Microcontroller;

public class WHNZ extends InstruccionMultiple {

	private int vecesQueFueEjecutado;

	public WHNZ(List<Instruccion> instrucciones) {
		super(instrucciones);
	}

	public void doExecute(Microcontroller micro) {
		vecesQueFueEjecutado = 0;
		while (micro.getAAcumulator() != 0) {
			vecesQueFueEjecutado++;
			super.doExecute(micro);
		}
	}

	/**
	 * Solo para test
	 * @return
	 */
	public int getVecesQueFueEjecutado() {
		return vecesQueFueEjecutado;
	}

}
