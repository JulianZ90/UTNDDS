package org.uqbar.xunit

abstract class AbstractTest implements Test {

	@Override
	def run() {
		this.before()
		def result = this.test()
		this.after()
		result		
	}
	
	def before() {
	}
	
	def after() {
	}
	
	abstract def test()

}
