package org.uqbar.xunit

class BeforeErrorTest extends AbstractTest {

	@Override
	def test() {
		return true;
	}

	@Override
	def before() {
		throw new RuntimeException("Problema en el before")
	};
}
