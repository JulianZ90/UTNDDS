package xunit.example;

import xunit.XTestTest;
import xunit.XUnitTester;
import xunit.readers.AnnotationReader;

public class MetaMetaTest {

	public static void main(String[] args) {
		XUnitTester tester = new XUnitTester(new AnnotationReader());
		
		tester.testear(XTestTest.class, new ConsoleReporter());
	}
}
