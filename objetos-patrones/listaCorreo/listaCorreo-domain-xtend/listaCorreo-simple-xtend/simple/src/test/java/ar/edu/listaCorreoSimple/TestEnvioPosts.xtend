package ar.edu.listaCorreoSimple

import ar.edu.listaCorreoSimple.envioMails.Mail
import ar.edu.listaCorreoSimple.envioMails.MailException
import ar.edu.listaCorreoSimple.envioMails.MailSender
import ar.edu.listaCorreoSimple.envioMails.StubMailSender
import ar.edu.listaCorreoSimple.exceptions.BusinessException
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.mockito.ArgumentMatcher
import org.mockito.invocation.InvocationOnMock
import org.mockito.stubbing.Answer

import static org.mockito.Matchers.*
import static org.mockito.Mockito.*

class TestEnvioPosts {

	ListaCorreo listaProfes
	ListaCorreo listaAlumnos
	ListaCorreo listaVacia
	Miembro dodain
	Miembro nico
	Miembro deby
	Miembro alumno
	Miembro fede
	Post mensajeAlumnoRecursividad
	Post mensajeAlumnoRecursividadOk
	Post mensajeAlumnoOrdenSuperior
	Post mensajeDodainAlumnos
	Post mensajeAListaVacia
	Post mensajeDodainProfes
	StubMailSender stubMailSender = new StubMailSender
	MailSender mockedMailSender

	@Before
	def void init() {
		mockedMailSender = mock(typeof(MailSender))

		/** Listas de correo */
		listaAlumnos = ListaCorreo.listaAbierta()
		listaProfes = ListaCorreo.listaCerrada()

		/** Profes */
		dodain = new Miembro("fernando.dodino@gmail.com")
		nico = new Miembro("nicolas.passerini@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")

		/** Alumnos **/
		alumno = new Miembro("alumno@uni.edu.ar")
		fede = new Miembro("fede@uni.edu.ar")

		/** en la lista de profes están los profes */
		listaProfes => [
			agregarMiembro(dodain)
			agregarMiembro(nico)
			agregarMiembro(deby)
			mailSender = stubMailSender
		]

		/** en la de alumnos hay alumnos y profes */
		listaAlumnos => [
			agregarMiembro(dodain)
			agregarMiembro(deby)
			agregarMiembro(fede)
			mailSender = stubMailSender
		]

		listaVacia = ListaCorreo.listaAbierta()

		mensajeAlumnoRecursividad = new Post(alumno, "Hola, queria preguntar que es la recursividad", listaProfes)
		mensajeDodainAlumnos = new Post(dodain,
			"Para explicarte recursividad tendría que explicarte qué es la recursividad", listaAlumnos)
		mensajeAlumnoRecursividadOk = new Post(alumno, "Hola, queria preguntar que es la recursividad", listaAlumnos)
		mensajeAlumnoOrdenSuperior = new Post(alumno, "Orden superior tiene que ver con religion? Gracias!",
			listaAlumnos)
		mensajeDodainProfes = new Post(dodain, "Cuantos TPs hacemos?", listaProfes)
		mensajeAListaVacia = new Post(dodain, "Sale la nueva de Sillicon Valley!", listaVacia)
	}

	/*************************************************************/
	/*                     TESTS CON STUBS                       */
	/*                      TEST DE ESTADO                       */
	/*************************************************************/
	@Test(expected=typeof(BusinessException))
	def void alumnoNoPuederecibirPostPostAListaProfes() {
		listaProfes.recibirPost(mensajeAlumnoRecursividad)
	}

	@Test
	def void alumnoPuederecibirPostMailAListaAbiertaAunSinPertenecerALaLista() {
		Assert.assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
		listaAlumnos.recibirPost(mensajeAlumnoRecursividad)
		Assert.assertEquals(1, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	@Test
	def void alumnoEnvia2MailsYSeRegistranAmbosMailsEnElStub() {
		Assert.assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
		listaAlumnos.recibirPost(mensajeAlumnoRecursividad)
		listaAlumnos.recibirPost(mensajeAlumnoOrdenSuperior)
		Assert.assertEquals(2, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	@Test
	def void alumnoQuiererecibirPostDosMailsPeroElSegundoFallaYSoloSeEnviaUno() {
		Assert.assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)

		// Con Mockito
		// Decoramos al stub para hacer que devuelva error cuando envíe el segundo mensaje
		val stubMailSenderDecorado = spy(stubMailSender)
		
		// Acá decimos declarativamente: Que tire MailException
		// - cuando al objeto stubMailSenderDecorado
		// - reciba un mensaje send
		// - con un parametro igual al Mail que le pasamos como ejemplo
		//   (ademas tuvimos que redefinir el equals del Mail para que detecte
		//    dos mails iguales si tienen el mismo mensaje)
		doThrow(typeof(MailException)).when(stubMailSenderDecorado).send(
			new Mail => [
				message = mensajeAlumnoOrdenSuperior.mensaje
			])

		try {
			listaAlumnos => [
				mailSender = stubMailSenderDecorado
				recibirPost(mensajeAlumnoRecursividad)
				recibirPost(mensajeAlumnoOrdenSuperior)
			]
			Assert.assertTrue("Deberia haber tirado error", false)
		} catch (MailException e) {
			// Esperamos que tire error
		}
		Assert.assertEquals(1, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	def void alumnoEnvia2MailsConMockitoQueGeneraUnaCascaraVaciaDeLaInterfazQueHacePrintln() {
		val listaMockeada = mock(typeof(MailSender))
		// Revisar!!
		doAnswer(new ImprimirPorConsola).when(listaMockeada).send(any(typeof(Mail)))
		listaAlumnos => [
			mailSender = listaMockeada
			recibirPost(mensajeAlumnoRecursividadOk)
			recibirPost(mensajeAlumnoOrdenSuperior)
		]

	}

	/*************************************************************/
	/*                     TESTS CON MOCKS                       */
	/*                  TEST DE COMPORTAMIENTO                   */
	/*************************************************************/
	@Test
	def void testEnvioPostAListaAlumnosLlegaATodosLosOtrosSuscriptos() {
		listaAlumnos => [
			mailSender = mockedMailSender
			// un alumno envía un mensaje a la lista
			recibirPost(mensajeDodainAlumnos)
		]

		//verificacion
		//test de comportamiento, verifico que se recibirPoston 2 mails 
		// a fede y a deby, no así a dodi que fue el que envió el post
		verify(mockedMailSender, times(2)).send(any(typeof(Mail)))
	}

	@Test
	def void testAlQueEnviaPostNoLeLlegaMail() {
		listaAlumnos => [
			mailSender = mockedMailSender
			recibirPost(mensajeDodainAlumnos)
		]

		// busco que nunca hayan enviado un mail al emisor del post: fdodino
		verify(mockedMailSender, never).send(argThat(new MailEnviadoA(dodain.mail)))
	}

	@Test
	def void testListaVaciaNoLeLlegaNingunPostANadie() {
		listaVacia => [
			mailSender = mockedMailSender
			recibirPost(mensajeAListaVacia)
		]
		verify(mockedMailSender, never).send(any(Mail))
	}

	@Test
	def void recibirPostMailAListaAlumnos() {
		listaAlumnos => [
			mailSender = mockedMailSender
			recibirPost(mensajeAlumnoRecursividad)
		]
		verify(mockedMailSender, atLeastOnce).send(any(Mail))
	}
}

class ImprimirPorConsola implements Answer<Void> {

	override answer(InvocationOnMock invocation) throws Throwable {
		val arguments = invocation.arguments
		val mail = arguments.get(0) as Mail
		println("=====> Simulación envío de mail by MOCKITO")
		println("   From: " + mail.from + " | To: " + mail.to + " | Message: " + mail.message)
		println("********************************************************")
		return null
	}

}

class MailEnviadoA extends ArgumentMatcher<Mail> {

	String mailDestino

	new(String mailDestino) {
		this.mailDestino = mailDestino
	}

	override matches(Object argument) {
		(argument as Mail).to.equalsIgnoreCase(mailDestino)
	}

}
