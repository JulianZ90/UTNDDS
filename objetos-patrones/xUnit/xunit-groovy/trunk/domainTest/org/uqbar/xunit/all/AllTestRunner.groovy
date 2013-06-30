package org.uqbar.xunit.all
import org.uqbar.xunit.*
import org.uqbar.xunit.dsl.ClosureBasedTest
import org.uqbar.xunit.dsl.DslExample;


class AllTestRunner {

	public static void main(String[] args) {
		ConsoleReporter reporter = new ConsoleReporter()
		new CompositeTest([	//new AfterErrorTest(), 
							//new BeforeErrorTest(), 
							new DivisionErrorExample(), 
							new DivisionErrorWithUnexpectedExceptionExample(), 
							new DivisionFailureWithoutExceptionExample(), 
							new DivisionSuccessWithExceptionExample(), 
							new SumaFailureManyAssertionsExample(), 
							new SumaSuccessExample(), 
							new SumaSuccessWithEnvironmentExample(),
							new ClosureBasedTest("AssertTrueSuccessTest", {assertTrue("esto deberia estar bien", true)}),
							new ClosureBasedTest("AssertTrueFailureTest",{assertTrue("esto esta mal a proposito", false)}),
							new DslExample()
							])
		.run(reporter)
		
	}

}
