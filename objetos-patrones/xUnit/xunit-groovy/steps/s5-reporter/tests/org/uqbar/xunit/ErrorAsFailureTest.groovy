package org.uqbar.xunit

import org.junit.Test;

class ErrorAsFailureTest extends XUnitTest {
	
	@Test
	void testMethodThrowException() {
		this.runAndAssertFailure(new DivisionErrorTest())
	}
	
	@Test(expected=RuntimeException.class)
	void beforeError() {
		run(new BeforeErrorTest())
	}
	
	@Test(expected=RuntimeException.class)
	void afterError() {
		run(new AfterErrorTest())
	}
	 

}
