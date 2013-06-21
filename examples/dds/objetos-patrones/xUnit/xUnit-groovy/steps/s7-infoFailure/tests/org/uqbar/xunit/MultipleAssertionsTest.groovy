package org.uqbar.xunit

class MultipleAssertionsTest extends XUnitTest {

	@org.junit.Test
	void success() {
		assertSuccess(run(new SumaSuccessManyAssertions()))
	}

	@org.junit.Test
	void failure() {
		assertFailure(SumaFailureManyAssertions.MESSAGE, run(new SumaFailureManyAssertions()))
	}
}
