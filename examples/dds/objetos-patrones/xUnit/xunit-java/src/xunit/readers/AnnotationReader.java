package xunit.readers;

import java.lang.reflect.Method;

import xunit.annotations.XTest;

public class AnnotationReader implements TestReader {

	@Override
	public boolean metodoValido(Method method) {
		return method.isAnnotationPresent(XTest.class);
	}

	
}
