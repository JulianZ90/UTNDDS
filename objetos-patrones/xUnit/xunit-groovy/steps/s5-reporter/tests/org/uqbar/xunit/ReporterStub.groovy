package org.uqbar.xunit

import org.codehaus.groovy.runtime.DefaultGroovyMethods;
import org.junit.Assert;

class ReporterStub implements Reporter {

	
	def failures = []
	def successful = []
	
	@Override
	def failure(Test test) {
		failures.add(test);
	}

	@Override
	def success(Test test) {
		successful.add(test);
	}
	
	def assertSuccess(test) {
		Assert.assertTrue("El ${test} no fue exitoso", test in successful)
	}
	
	def assertFailure(test) {
		Assert.assertTrue("El ${test} no fue fallido", test in failures)
	}
	

}
