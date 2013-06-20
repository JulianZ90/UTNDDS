package org.uqbar.xunit

/**
 * Se espera que este test falle
 *
 */
class DivisionErrorTest extends AbstractTest {

	@Override
	def test() {
		1 / 0 == Float.MAX_VALUE
	}

}
