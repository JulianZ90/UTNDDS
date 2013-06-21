package org.uqbar.xunit

/**
 * Se espera que este test falle con ClassCastException
 *
 */
class DivisionFailureWithoutExceptionTest extends AbstractTest {

	@Override
	def test() {
		this.assertException(ArithmeticException.class, { 1 / 1})
	}

}
