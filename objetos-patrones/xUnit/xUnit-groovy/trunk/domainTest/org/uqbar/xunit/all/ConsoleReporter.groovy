package org.uqbar.xunit.all

import org.uqbar.xunit.Reporter
import org.uqbar.xunit.Test;

class ConsoleReporter implements Reporter {

	public ConsoleReporter() {
		// TODO Auto-generated constructor stub
	}

	@Override
	def success(Test test) {
		printResult(test, "SUCCESS")
	}

	@Override
	def error(Test test, Exception ex) {
		printResult(test, "ERROR", ex.message)
	//	ex.printStackTrace();
	}

	@Override
	def failure(Test test, String message) {
		printResult(test, "FAILURE", message)
	}
	
	def printResult(test, result, message = "") {
		println "${test} ${result} ${message}"	
	}

}
