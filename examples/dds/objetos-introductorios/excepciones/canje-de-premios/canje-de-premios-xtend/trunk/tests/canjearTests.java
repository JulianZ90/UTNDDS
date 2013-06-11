import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.utn.frba.extend.dominio.Cliente;
import edu.utn.frba.extend.dominio.Premio;
import edu.utn.frba.extend.excepciones.NoTienePuntosSuficientesException;
import edu.utn.frba.mock.PremioNoDisponible;

public class canjearTests {

	private Cliente clienteQueTiene_100_Puntos;

	@Before
	public void setup() {
		clienteQueTiene_100_Puntos = new Cliente(100);
	}

	@Test
	public void canjearUnPremioExitosamente_test() {
		Premio premioQueVale_50_Puntos = new Premio(50, "remera", 0);
		clienteQueTiene_100_Puntos.canjearPremio(premioQueVale_50_Puntos);
		assertEquals(clienteQueTiene_100_Puntos.getPuntosAcum(), 50);
	}

	@Test(expected = NoTienePuntosSuficientesException.class)
	public void intentarCanjearUnPremioSinLosPuntosSuficientes_test() {
		Premio premioQueVale_150_Puntos = new Premio(150, "pantalon", 0);
		clienteQueTiene_100_Puntos.canjearPremio(premioQueVale_150_Puntos);
	}

	@Test
	public void intentarCanjearUnPremioNoDisponibleYQueSeAgregueALaWishList_test() {
		Premio premioNoDisponible = new PremioNoDisponible(50, "buzo", 10);
		clienteQueTiene_100_Puntos.canjearPremio(premioNoDisponible);
		assertEquals(clienteQueTiene_100_Puntos.getListaDeseos().size(), 1);
	}
}
