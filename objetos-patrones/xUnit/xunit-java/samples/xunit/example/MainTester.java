package xunit.example;

import fixture.TestConResultadosMezclados;
import xunit.XUnitTester;

public class MainTester {

	public static void main(String[] args) {
		XUnitTester tester = new XUnitTester();
		
		tester.testear(TestConResultadosMezclados.class, new ConsoleReporter());
	}
}
