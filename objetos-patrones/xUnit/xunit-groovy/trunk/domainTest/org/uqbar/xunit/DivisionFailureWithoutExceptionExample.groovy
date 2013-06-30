package org.uqbar.xunit


class DivisionFailureWithoutExceptionExample extends AbstractTest {

	@Override
	def test() {
		this.assertException(ArithmeticException.class, { 1 / 1})
	}

}
