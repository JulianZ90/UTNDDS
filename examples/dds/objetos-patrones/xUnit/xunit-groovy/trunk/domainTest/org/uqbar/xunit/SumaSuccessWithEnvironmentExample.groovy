package org.uqbar.xunit

class SumaSuccessWithEnvironmentExample extends AbstractTest {

	def a,b
	
	@Override
	def before() {
		a = 2
		b = 3
	}
	
	@Override
	def test() {
		this.assertEquals(5, a + b);
	}
	
	@Override
	def after() {
		a = null
		b = null
	}
}
