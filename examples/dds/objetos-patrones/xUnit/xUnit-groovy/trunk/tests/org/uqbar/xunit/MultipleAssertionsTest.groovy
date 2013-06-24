package org.uqbar.xunit

class MultipleAssertionsTest extends XUnitTest {

	@org.junit.Test
	void success() {
		assertSuccess(run(new SumaSuccessManyAssertionsExample()))
	}

	@org.junit.Test
	void failure() {
		assertFailure(SumaFailureManyAssertionsExample.MESSAGE, run(new SumaFailureManyAssertionsExample()))
	}
}
