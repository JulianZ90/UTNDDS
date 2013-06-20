package org.uqbar.xunit

import org.junit.Test;

class ErrorAsFailureTest extends XUnitTest {
	
	@Test
	void testMethodThrowException() {
		this.assertTestFailure(new DivisionErrorTest())
	}
	
	@Test(expected=RuntimeException.class)
	void beforeError() {
		new BeforeErrorTest().run()
	}
	
	@Test(expected=RuntimeException.class)
	void afterError() {
		new AfterErrorTest().run()
	}
	 

}
