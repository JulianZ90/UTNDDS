package xunit;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import xunit.annotations.XTest;
import xunit.readers.AnnotationReader;
import xunit.resultados.Resultado;
import fixture.MiTestFeliz;
import fixture.MiTestInfeliz;
import fixture.TestConResultadosMezclados;

public class XTestTest {

	@Test
	@XTest
	public void xUnitValidaQueLosTestsPasan() {
		XUnitTester tester = new XUnitTester();
		Resultado resultado = new Resultado();
		tester.testear(MiTestFeliz.class, resultado);
		assertTrue(resultado.todosPasaron());
	}

	@Test
	@XTest
	public void xUnitValidaQueLosTestsFallan() {
		XUnitTester tester = new XUnitTester();
		Resultado resultado = new Resultado();
		tester.testear(MiTestInfeliz.class, resultado);
		assertFalse(resultado.todosPasaron());
	}

	@Test
	@XTest
	public void xUnitValidaResultadosMezclados() {
		XUnitTester tester = new XUnitTester();
		Resultado resultado = new Resultado();
		tester.testear(TestConResultadosMezclados.class, resultado);

		assertTrue(resultado.getResultadito(0).paso());
		assertTrue(resultado.getResultadito(1).fallo());
		assertTrue(resultado.getResultadito(2).tiroExcepcion());
	}

	@Test
	@XTest
	public void xUnitTestConAnnotations() {
		XUnitTester tester = new XUnitTester(new AnnotationReader());
		Resultado resultado = new Resultado();
		tester.testear(TestConAnnotation.class, resultado);

	}
	
	
	
	
	
	
	
	
	
	
}
