package org.uqbar.xunit

import org.junit.Test;

class TestRunTest extends XUnitTest {

	@Test
	void run() {
		assertSuccess(run(new SumaSuccessExample()));	
	}
}
