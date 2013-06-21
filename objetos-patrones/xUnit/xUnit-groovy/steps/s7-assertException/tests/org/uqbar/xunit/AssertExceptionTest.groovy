package org.uqbar.xunit

class AssertExceptionTest extends XUnitTest {

	@org.junit.Test
	void success() {
		assertSuccess(run(new DivisionSuccessWithExceptionTest()))
	}
	
	@org.junit.Test
	void failure() {
		assertFailure(run(new DivisionFailureWithoutExceptionTest()))
	}
	
	@org.junit.Test
	void error() {
		assertError(RuntimeException.class, run(new DivisionErrorWithUnexpectedExceptionTest()))
	}
	
	
}
