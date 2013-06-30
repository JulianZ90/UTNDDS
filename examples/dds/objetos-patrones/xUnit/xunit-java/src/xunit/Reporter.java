package xunit;

import java.lang.reflect.Method;

public interface Reporter {

	void pasoUnTest(Class<?> testClass, Method metodoDeTest);

	void falloUnTest(Class<?> testClass, Method metodoDeTest);

	void tiroExcepcionUnTest(Class<?> testClass, Method metodoDeTest,
			Throwable e);

}