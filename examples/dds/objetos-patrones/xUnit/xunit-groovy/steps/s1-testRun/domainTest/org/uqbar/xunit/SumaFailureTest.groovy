package org.uqbar.xunit

class SumaFailureTest implements Test {

	@Override
	def run() {
		return 2 + 2 == 3;
	}


}
