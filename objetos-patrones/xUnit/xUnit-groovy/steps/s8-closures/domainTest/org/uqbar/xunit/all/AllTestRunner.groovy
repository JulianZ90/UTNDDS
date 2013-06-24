package org.uqbar.xunit.all
import org.uqbar.xunit.*
import org.uqbar.xunit.dsl.ClosureBasedTest


class AllTestRunner {

	public static void main(String[] args) {
		ConsoleReporter reporter = new ConsoleReporter()
		new CompositeTest([	//new AfterErrorTest(), 
							//new BeforeErrorTest(), 
							new DivisionErrorTest(), 
							new DivisionErrorWithUnexpectedExceptionTest(), 
							new DivisionFailureWithoutExceptionTest(), 
							new DivisionSuccessWithExceptionTest(), 
							new SumaFailureManyAssertions(), 
							new SumaSuccessTest(), 
							new SumaSuccessWithEnvironmentTest(),
							new ClosureBasedTest("AssertTrueSuccessTest", {assertTrue("esto deberia estar bien", true)}),
							new ClosureBasedTest("AssertTrueFailureTest",{assertTrue("esto esta mal a proposito", false)})
							])
		.run(reporter)
		
	}

}
