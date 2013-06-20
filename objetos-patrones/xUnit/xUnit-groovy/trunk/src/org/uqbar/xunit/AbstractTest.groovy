package org.uqbar.xunit

abstract class AbstractTest implements Test {

	@Override
	def run() {
		this.before()
		try {
			this.test()
		}
		catch(e)  {
		  	false
		}
		finally {
			this.after()
		}	
	}
	
	def before() {
	}
	
	def after() {
	}
	
	abstract def test()

}
