package org.uqbar.xunit

class AssertExceptionTest extends XUnitTest {

	@org.junit.Test
	void success() {
		assertSuccess(run(new DivisionSuccessWithExceptionExample()))
	}
	
	@org.junit.Test
	void failure() {
		assertFailure(run(new DivisionFailureWithoutExceptionExample()))
	}
	
	@org.junit.Test
	void error() {
		assertError(RuntimeException.class, run(new DivisionErrorWithUnexpectedExceptionExample()))
	}
	
	
}
