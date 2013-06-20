package org.uqbar.xunit

class AfterErrorTest extends AbstractTest {

	@Override
	def test() {
		return true;
	}

	def after() {
		throw new RuntimeException("Problema en el after")
	};
}
