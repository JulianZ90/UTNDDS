package org.uqbar.xunit


abstract class AbstractTest implements Test {

	@Override
	def run(Reporter reporter) {
		this.before()
		try {
			this.test()
			reporter.success(this)
		}
		catch(AssertionException e) {
			reporter.failure(this, e.getMessage())
		}
		catch(Exception e)  {
		  	reporter.error(this, e)
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

	def assertTrue(String message, boolean value) {
		if(!value) {
			throw new AssertionException(message)
		}
	}
	
	def assertFalse(String message, boolean value) {
		assertTrue(message, !value)
	}
	
	def assertEquals(String message, expected, result) {
		assertTrue("${message}. Expected ${expected} but was ${result}", expected == result)
	}
	
	def assertEquals(expected, result) {
		assertEquals("", expected, result)
	}
	
	
}
