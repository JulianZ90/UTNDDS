package org.uqbar.xunit

/**
 * Se espera que este test falle con error
 *
 */
class DivisionErrorWithUnexpectedExceptionTest extends AbstractTest {

	@Override
	def test() {
		this.assertException(ArithmeticException.class, {
			throw new RuntimeException("Rompete")
			1 / 0})
	}

}
