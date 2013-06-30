package fixture;

import org.junit.Assert;

public class TestConResultadosMezclados {

	public void testTrueEsTrue() {
		Assert.assertTrue(true);
	}

	public void testQuePincha() {
		Assert.assertTrue(false);
	}
	
	public void testConBug() {
		throw new NullPointerException();
	}
}
