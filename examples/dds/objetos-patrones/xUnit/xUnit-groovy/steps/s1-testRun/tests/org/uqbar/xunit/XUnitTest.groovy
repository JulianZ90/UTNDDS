package org.uqbar.xunit

import static org.junit.Assert.*;



abstract class XUnitTest {

	def assertTestSuccess(Test test) {
		assertTrue(test.run());
	}
	
	def assertTestFailure(Test test) {
		assertFalse(test.run());
	}
	
}
