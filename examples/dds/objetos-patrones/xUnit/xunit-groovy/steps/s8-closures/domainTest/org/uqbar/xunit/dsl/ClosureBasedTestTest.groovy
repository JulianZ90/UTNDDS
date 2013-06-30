package org.uqbar.xunit.dsl

import org.junit.Assert;
import org.junit.Test;
import org.uqbar.xunit.ReporterStub;
import org.uqbar.xunit.XUnitTest
import org.uqbar.xunit.dsl.ClosureBasedTest;


class ClosureBasedTestTest extends XUnitTest {


	@Test
	void closureSuccess() {
		def test = new ClosureBasedTest(
						beforeBlocks:[{a=5},{b=2}],
						testBlock:{assertEquals(7, a + b)},
						afterBlocks:[{a=null;b=null}])
		assertSuccess(run(test))
		Assert.assertEquals(null, test.a)
		Assert.assertEquals(null, test.b)
	}
	
	@Test
	void closureFailure() {
		def test = new ClosureBasedTest(
						beforeBlocks:[{a=5},{b=2}],
						testBlock:{assertEquals(8, a + b)},
						afterBlocks:[{a=null;b=null}])
		assertFailure(run(test))
		Assert.assertEquals(null, test.a)
		Assert.assertEquals(null, test.b)
	}
	
	@Test
	void closureError() {
		def test = new ClosureBasedTest(
						beforeBlocks:[{a=5},{b=2}],
						testBlock:{throw new RuntimeException("Blah")},
						afterBlocks:[{a=null;b=null}])
		assertError(RuntimeException, run(test))
		Assert.assertEquals(null, test.a)
		Assert.assertEquals(null, test.b)
	}


}
