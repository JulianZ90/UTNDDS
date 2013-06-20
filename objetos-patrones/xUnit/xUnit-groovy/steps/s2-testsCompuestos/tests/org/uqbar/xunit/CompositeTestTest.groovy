package org.uqbar.xunit;

import static org.junit.Assert.*;

class CompositeTestTest extends XUnitTest{

	@org.junit.Test 
	void ambosBien() {
		assertTestSuccess(new CompositeTest([new SumaSuccessTest(), new SumaSuccessTest()]))
	}
	
	@org.junit.Test
	void ambosMal() {
		assertTestFailure(new CompositeTest([new SumaFailureTest(), new SumaFailureTest()]))
	}

	@org.junit.Test
	void unoBienOtroMal() {
		assertTestFailure(new CompositeTest([new SumaSuccessTest(), new SumaFailureTest()]))
	}
	
	@org.junit.Test
	void unoMalOtroBien() {
		assertTestFailure(new CompositeTest([new SumaFailureTest(), new SumaSuccessTest()]))
	}

	@org.junit.Test
	void unoSoloBien() {
		assertTestSuccess(new CompositeTest([new SumaSuccessTest()]))
	}
	
	@org.junit.Test
	void unoSoloMal() {
		assertTestFailure(new CompositeTest([new SumaFailureTest()]))
	}
	
	@org.junit.Test
	void vacio() {
		assertTestSuccess(new CompositeTest())
	}
}
