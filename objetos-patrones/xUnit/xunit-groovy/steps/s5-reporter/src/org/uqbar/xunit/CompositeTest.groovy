package org.uqbar.xunit

import org.codehaus.groovy.runtime.DefaultGroovyMethods;

class CompositeTest implements Test {

	def tests = []

	CompositeTest(){
		
	} 
	
	CompositeTest(tests) {
		this.tests = tests
	}
	
	
	@Override
	def run(Reporter reporter) {
		tests*.run(reporter).inject(true, DefaultGroovyMethods.&and)
	}
	
	def addTest(Test test) {
		tests.add(test)
		this
	} 
	

}
