package xunit.resultados;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import xunit.Reporter;

public class Resultado implements Reporter {

	private List<Resultadito> resultaditos = new ArrayList<Resultadito>();

	@Override
	public void pasoUnTest(Class<?> testClass, Method metodoDeTest) {
		this.resultaditos.add(new ResultaditoPaso());
	}

	@Override
	public void falloUnTest(Class<?> testClass, Method metodoDeTest) {
		this.resultaditos.add(new ResultaditoFallo());
	}

	@Override
	public void tiroExcepcionUnTest(Class<?> testClass, Method metodoDeTest,
			Throwable e) {
		this.resultaditos.add(new ResultaditoExcepcion(e));
	}

	public boolean todosPasaron() {
		for (Resultadito resultadito : this.resultaditos) {
			if (!resultadito.paso()) {
				return false;
			}
		}
		return true;
	}

	public Resultadito getResultadito(int index) {
		return this.resultaditos.get(index);
	}

}
