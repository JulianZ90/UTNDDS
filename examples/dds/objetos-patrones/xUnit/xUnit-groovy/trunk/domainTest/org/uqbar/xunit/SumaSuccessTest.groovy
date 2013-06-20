package org.uqbar.xunit

class SumaSuccessTest implements Test {

	@Override
	def run() {
		return 2 + 2 == 4;
	}


}
