package org.uqbar.xunit

class MultipleAssertionsJUnitTest extends XUnitJUnitTest {

	@org.junit.Test
	void success() {
		assertSuccess(run(new SumaSuccessManyAssertionsExample()))
	}

	@org.junit.Test
	void failure() {
		assertFailure(SumaFailureManyAssertionsExample.MESSAGE, run(new SumaFailureManyAssertionsExample()))
	}
}
