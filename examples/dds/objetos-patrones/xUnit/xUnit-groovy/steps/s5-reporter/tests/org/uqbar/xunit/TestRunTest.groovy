package org.uqbar.xunit

import org.junit.Test;

class TestRunTest extends XUnitTest {

	@Test
	void run() {
		runAndAssertSuccess(new SumaSuccessTest());
		runAndAssertFailure(new SumaFailureTest());		
	}
}
