package org.uqbar.xunit

class SumaFailureManyAssertions extends AbstractTest {

	static MESSAGE = "Error a proposito"

	@Override
	def test() {
		this.assertEquals(2, 1 + 1)
		this.assertTrue(MESSAGE, false)
		this.assertEquals(4, 3 + 1)
	}

}
