package org.uqbar.xunit

import static org.junit.Assert.*;



abstract class XUnitTest {

	ReporterStub reporter = new ReporterStub() 
	

	def assertSuccess(Test test) {
		reporter.assertSuccess(test)
	}

	def assertFailure(Test test) {
		reporter.assertFailure(test)
	}
	
	def assertFailure(message, Test test) {
		reporter.assertFailure(message, test)
	}
	
	def assertError(exceptionClass, Test test) {
		reporter.assertError(exceptionClass, test);
	}
	
	def run(Test test) {
		test.run(this.reporter)
		test
	}
	
}
