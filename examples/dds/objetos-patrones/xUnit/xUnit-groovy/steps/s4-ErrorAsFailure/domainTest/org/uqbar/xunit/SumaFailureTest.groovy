package org.uqbar.xunit

class SumaFailureTest implements Test {

	@Override
	def run() {
		2 + 2 == 3;
	}


}
