package ar.edu.agricultores;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class TestAgricultor {

	Agricultor deangeli;
	Agricultor mendiguren;
	ReporteadorAgricultores reporter;

	@Before
	public void init() {
		deangeli = new Agricultor();
		deangeli.agregarParcela(new Parcela(15, new Trigo()));
		deangeli.agregarParcela(new Parcela(50, new Soja()));
		deangeli.agregarParcela(new Parcela(200, new Trigo()));
		mendiguren = new Agricultor();
		mendiguren.agregarParcela(new Parcela(15, new SojaTransgenica(true)));
		Parcela parcelaMendigurenConTrigo = new Parcela(20, new Trigo());
		parcelaMendigurenConTrigo.hectareas = 700;
		mendiguren.agregarParcela(parcelaMendigurenConTrigo);
		reporter = new ReporteadorAgricultores();
	}

	// PUNTO 4
	@Test
	public void testCultivosDeAgricultor() {
		Assert.assertEquals(2, reporter.cultivos(deangeli).size());
	}

	@Test
	public void testAgricultorSinParcelasSubutilizadas() {
		Assert.assertFalse(reporter.algunaParcelaSubutilizada(deangeli));
	}

	@Test
	public void testAgricultorConParcelasSubutilizadas() {
		Assert.assertTrue(reporter.algunaParcelaSubutilizada(mendiguren));
	}

}
