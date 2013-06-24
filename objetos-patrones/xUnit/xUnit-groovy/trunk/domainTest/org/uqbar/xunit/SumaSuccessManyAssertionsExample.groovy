package org.uqbar.xunit

class SumaSuccessManyAssertionsExample extends AbstractTest {

	@Override
	def test() {
		this.assertEquals(2, 1 + 1)
		this.assertEquals(3, 2 + 1)
		this.assertEquals(4, 3 + 1)
	}

}
