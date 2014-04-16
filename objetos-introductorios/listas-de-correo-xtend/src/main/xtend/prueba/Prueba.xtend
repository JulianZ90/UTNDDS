package prueba

import org.uqbar.listas.de.correo.dominio.ListaDeCorreo
import org.uqbar.listas.de.correo.dominio.Usuario
import org.uqbar.listas.de.correo.dominio.statefull.tipoSuscripcion.SuscripcionAbierta
import org.uqbar.listas.de.correo.dominio.statefull.tipoSuscripcion.SuscripcionCerrada
import org.uqbar.listas.de.correo.dominio.stateless.tipoEnvio.TipoDeEnvioLibre

/**
 * Esta es una prueba con todo lo que NO vamos a hacer nunca mas
 * NO lo copien
 * NO es un ejemplo
 * Es una demostracion de lo complicado que es probar de esta forma
 */
class Prueba {


	def static void main(String[] args) {
		var usuario = new Usuario("a@a.a")
		
		var listaAbierta = new ListaDeCorreo(new TipoDeEnvioLibre)
		listaAbierta.setTipoDeSuscripcion(new SuscripcionAbierta(listaAbierta))
		listaAbierta.suscribir(usuario) 
		println(listaAbierta.estaSuscripto(usuario))
		
		var listaCerrada = new ListaDeCorreo(new TipoDeEnvioLibre)
		listaCerrada.setTipoDeSuscripcion(new SuscripcionCerrada(listaCerrada))
		listaCerrada.suscribir(usuario)
		println(listaCerrada.estaSuscripto(usuario))

		listaCerrada.tipoDeSuscripcion.aprobar(usuario)
		println(listaCerrada.estaSuscripto(usuario))
		
		
	}
	
	
	
	
	
	/**
	 * true
	 * false
	 * true
	 */
	
	
	
	
	
	
	
	
}