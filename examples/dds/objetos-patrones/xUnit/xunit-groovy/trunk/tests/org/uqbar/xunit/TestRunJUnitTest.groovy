package org.uqbar.xunit

import org.junit.Test;

class TestRunJUnitTest extends XUnitJUnitTest {

	@Test
	void run() {
		assertSuccess(run(new SumaSuccessExample()));	
	}
}
