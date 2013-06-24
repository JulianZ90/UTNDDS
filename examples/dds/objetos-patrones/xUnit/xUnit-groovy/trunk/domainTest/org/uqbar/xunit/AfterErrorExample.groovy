package org.uqbar.xunit

class AfterErrorExample extends AbstractTest {

	@Override
	def test() {
	}

	def after() {
		throw new RuntimeException("Problema en el after")
	};
}
