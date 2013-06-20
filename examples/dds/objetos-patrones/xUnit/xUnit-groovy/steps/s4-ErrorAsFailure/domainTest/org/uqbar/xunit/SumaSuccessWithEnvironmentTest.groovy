package org.uqbar.xunit

class SumaSuccessWithEnvironmentTest extends AbstractTest {

	def a,b
	
	@Override
	def before() {
		a = 2
		b = 3
	}
	
	@Override
	public Object test() {
		a + b == 5;
	}
	
	@Override
	def after() {
		a = null
		b = null
	}
}
