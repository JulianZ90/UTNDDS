package org.uqbar.xunit


class DivisionSuccessWithExceptionExample extends AbstractTest {

	@Override
	def test() {
		this.assertException(ArithmeticException.class, {1 / 0})
	}

}
