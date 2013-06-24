package org.uqbar.xunit

import org.junit.Test;

class ErrorAsFailureTest extends XUnitTest {
	
	@Test
	void testMethodThrowException() {
		assertError(ArithmeticException, run( new DivisionErrorExample()))
	}
	
	@Test(expected=RuntimeException.class)
	void beforeError() {
		run(new BeforeErrorExample())
	}
	
	@Test(expected=RuntimeException.class)
	void afterError() {
		run(new AfterErrorExample())
	}
	 

}
