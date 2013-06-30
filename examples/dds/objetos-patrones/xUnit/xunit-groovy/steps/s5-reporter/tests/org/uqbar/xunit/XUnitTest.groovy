package org.uqbar.xunit

import static org.junit.Assert.*;



abstract class XUnitTest {

	ReporterStub reporter = new ReporterStub() 
	
	
	def runAndAssertSuccess(Test test) {
		run(test)
		assertSuccess(test)
	}

	def runAndAssertFailure(Test test) {
		run(test);
		assertFailure(test)
	}

	def assertSuccess(Test test) {
		reporter.assertSuccess(test)
	}
	

	def assertFailure(Test test) {
		reporter.assertFailure(test)
	}
	
	def run(Test test) {
		test.run(this.reporter)
	}
	
}
