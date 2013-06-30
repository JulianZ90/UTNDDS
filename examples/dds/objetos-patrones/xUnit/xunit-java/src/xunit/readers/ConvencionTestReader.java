package xunit.readers;

import java.lang.reflect.Method;

public class ConvencionTestReader implements TestReader {

	public boolean metodoValido(Method method) {
		return method.getName().startsWith("test");
	}
}
