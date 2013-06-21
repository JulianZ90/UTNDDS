package org.uqbar.xunit

import org.codehaus.groovy.runtime.DefaultGroovyMethods;
import org.junit.Assert;

class ReporterStub implements Reporter {

	
	def failures = [:]
	def errors = [:]
	def successful = []
	
	
	@Override
	def failure(Test test, String message) {
		this.failures.put(test, message);
	}
	
	def error(Test test, Exception ex) {
		this.errors.put(test, ex)
	}

	@Override
	def success(Test test) {
		this.successful.add(test);
	}
	
	def assertSuccess(test) {
		Assert.assertTrue("El ${test} no fue exitoso", test in successful)
	}
	
	def assertError(test) {
		Assert.assertTrue("El ${test} no termino con error", test in errors.keySet())
	}
	
	def assertError(exceptionClass, test) {
		assertError(test)
		assertException(test, exceptionClass)
	}
	
	def assertException(test, Class exceptionClass) {
		Assert.assertTrue("El ${test} no termino con error", exceptionClass.isAssignableFrom(errors[test].class))
	}
	
	def assertFailure(test) {
		Assert.assertTrue("El ${test} no fue fallido", test in failures.keySet())
	}
	
	def assertMessage(message, test) {
		Assert.assertTrue("El ${test} no reporto el mensaje esperado:${message}", failures[test] == message)
	}
	
	def assertFailure(message, test) {
		assertFailure(test)
		assertMessage(message, test)	
	}
	

}
