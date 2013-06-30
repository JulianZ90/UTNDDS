package org.uqbar.xunit

abstract class AbstractTest implements Test {

	@Override
	def run(Reporter reporter) {
		this.before()
		try {
			if (this.test()) {
				reporter.success(this)
			}
			else {
				reporter.failure(this)
			}
		}
		catch(e)  {
		  	reporter.failure(this)
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
