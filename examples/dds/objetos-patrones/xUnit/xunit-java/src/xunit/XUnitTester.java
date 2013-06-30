package xunit;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;

import xunit.readers.ConvencionTestReader;
import xunit.readers.TestReader;

public class XUnitTester {

	private final TestReader reader;

	public XUnitTester() {
		this(new ConvencionTestReader());
	}

	public XUnitTester(TestReader reader) {
		this.reader = reader;
	}

	public void testear(Class<?> testClass, Reporter reporter) {
		for (Method metodoDeTest : metodosDeTest(testClass)) {
			evaluarTest(testClass, metodoDeTest, reporter);
		}
	}

	private Collection<Method> metodosDeTest(Class<?> testClass) {
		Collection<Method> testMethods = new ArrayList<Method>();
		for (Method method : testClass.getMethods()) {
			if (esTest(method)) {
				testMethods.add(method);
			}
		}
		return testMethods;
	}

	protected boolean esTest(Method method) {
		return esNulario(method) && reader.metodoValido(method);
	}

	

	private boolean esNulario(Method method) {
		return method.getParameterTypes().length == 0;
	}


	private void evaluarTest(Class<?> testClass, Method metodoDeTest,
			Reporter resultado) {
		try {
			Object test = testClass.newInstance();
			metodoDeTest.invoke(test);
			resultado.pasoUnTest(testClass, metodoDeTest);
		}
		// Fallo dentro de la invocacion del metodo de test
		catch (InvocationTargetException e) {
			if(e.getCause().getClass() == AssertionError.class) {
				resultado.falloUnTest(testClass, metodoDeTest);
			}
			else {
				resultado.tiroExcepcionUnTest(testClass, metodoDeTest, e.getCause());
			}
		} 
		// Invocacion del método estaba mal
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}



