package org.uqbar.xunit

class AfterErrorTest extends AbstractTest {

	@Override
	def test() {
	}

	def after() {
		throw new RuntimeException("Problema en el after")
	};
}
