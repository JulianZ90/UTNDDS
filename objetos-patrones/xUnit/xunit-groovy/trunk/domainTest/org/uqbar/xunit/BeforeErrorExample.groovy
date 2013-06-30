package org.uqbar.xunit

class BeforeErrorExample extends AbstractTest {

	@Override
	def test() {
	}

	@Override
	def before() {
		throw new RuntimeException("Problema en el before")
	};
}
