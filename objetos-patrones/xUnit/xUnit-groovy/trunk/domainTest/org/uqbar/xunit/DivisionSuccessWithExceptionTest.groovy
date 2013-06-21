package org.uqbar.xunit

/**
 * Se espera que este test
 *
 */
class DivisionSuccessWithExceptionTest extends AbstractTest {

	@Override
	def test() {
		this.assertException(ArithmeticException.class, {1 / 0})
	}

}
