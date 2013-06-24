package org.uqbar.xunit;

import static org.junit.Assert.*;

class CompositeTestTest extends XUnitTest{

	def successful1 = new SumaSuccessExample();
	def successful2 = new SumaSuccessExample();
	def failure1 = new SumaFailureExample();
	def failure2 = new SumaFailureExample(); 
	
	@org.junit.Test 
	void ambosBien() {
		run(new CompositeTest([successful1, successful2]))
		this.assertSuccess(successful1)
		this.assertSuccess(successful2)
		
	}
	
	@org.junit.Test
	void ambosMal() {
		run(new CompositeTest([failure1, failure2]))
		this.assertFailure(failure1)
		this.assertFailure(failure2)
	}

	@org.junit.Test
	void unoBienOtroMal() {
		run(new CompositeTest([successful1, failure1]))
		this.assertSuccess(successful1)
		this.assertFailure(failure1)
	}
	
	@org.junit.Test
	void unoMalOtroBien() {
		run(new CompositeTest([failure1, successful1]))
		this.assertFailure(failure1)
		this.assertSuccess(successful1)
	}

	@org.junit.Test
	void unoSoloBien() {
		run(new CompositeTest([successful1]))
		this.assertSuccess(successful1)
	}
	
	@org.junit.Test
	void unoSoloMal() {
		run(new CompositeTest([failure1]))
		this.assertFailure(failure1)
	}
	
	@org.junit.Test
	void vacio() {
		run(new CompositeTest())
	}
}
