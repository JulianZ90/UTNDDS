package xunit.example;

import java.lang.reflect.Method;

import xunit.Reporter;

public class ConsoleReporter implements Reporter {

	@Override
	public void pasoUnTest(Class<?> testClass, Method metodoDeTest) {
		System.out.println("PASO: " + testClass.getSimpleName() + "." + metodoDeTest.getName());
	}

	@Override
	public void falloUnTest(Class<?> testClass, Method metodoDeTest) {
		System.out.println("FALLO: " + testClass.getSimpleName() + "." + metodoDeTest.getName());
	}

	@Override
	public void tiroExcepcionUnTest(Class<?> testClass, Method metodoDeTest,
			Throwable e) {
		System.out.println("ERROR: " + testClass.getSimpleName() + "." + metodoDeTest.getName());
		System.out.println("Excepcion " + e.getClass().getName() + " Mensaje: "+ e.getMessage());
	}

}
