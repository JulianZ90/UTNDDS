package org.uqbar.xunit

class SumaFailureExample extends AbstractTest {

	@Override
	def test() {
		this.assertEquals(2 + 2, 3);
	}


}
