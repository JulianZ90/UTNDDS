package org.uqbar.xunit

/**
 * Se espera que este test falle
 *
 */
class DivisionErrorExample extends AbstractTest {

	@Override
	def test() {
		this.assertEquals("Se esperada dividir por cero", Float.MAX_VALUE,1 / 0)
	}

}
