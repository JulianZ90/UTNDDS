package xunit;

import xunit.annotations.XTest;
import junit.framework.Assert;

public class TestConAnnotation {

	@XTest
	public void trueEsTrue() {
		Assert.assertTrue(true);
	}

	@XTest
	public void aQuePincha() {
		Assert.assertTrue(false);
	}

	@XTest
	public void conBug() {
		throw new NullPointerException();
	}

}
