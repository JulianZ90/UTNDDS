package org.uqbar.xunit
import static org.junit.Assert.*

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;


class EnvironmentTest extends XUnitTest {
	
	@Test
	void environment() {
		def test = new SumaSuccessWithEnvironmentExample()
		this.assertSuccess(this.run(test))
		Assert.assertEquals(null, test.a)
		Assert.assertEquals(null, test.b)		
	}

}
