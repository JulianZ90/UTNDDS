package ar.edu.listaCorreo

import ar.edu.listaCorreo.exceptions.BusinessException
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import ar.edu.listaCorreo.observers.MalasPalabrasObserver
import ar.edu.listaCorreo.observers.MailObserver
import ar.edu.listaCorreo.observers.StubMailSender
import java.util.List
import static org.mockito.Mockito.*
import ar.edu.listaCorreo.observers.Mail

class TestEnvioPosts {

	Lista listaProfes
	Lista listaAlumnos
	Miembro dodain
	Miembro nico
	Miembro deby
	Miembro alumno
	Miembro fede
	Post mensajeAlumno
	Post mensajeDodainAlumnos
	Post mensajeDodainProfes
	StubMailSender stubMailSender = new StubMailSender
	MalasPalabrasObserver malasPalabrasObserver = new MalasPalabrasObserver

	@Before
	def void init() {

		/** Listas de correo */
		listaAlumnos = Lista::listaAbierta()
		listaProfes = Lista::listaCerrada()

		/** Profes */
		dodain = new Miembro("fernando.dodino@gmail.com")
		nico = new Miembro("nicolas.passerini@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")

		/** Alumnos **/
		alumno = new Miembro("alumno@uni.edu.ar")
		fede = new Miembro("fede@uni.edu.ar")

		/** en la lista de profes están los profes */
		listaProfes.agregarMiembro(dodain)
		listaProfes.agregarMiembro(nico)
		listaProfes.agregarMiembro(deby)
		listaProfes.agregarPostObserver(new MailObserver(stubMailSender))

		/** en la de alumnos hay alumnos y profes */
		listaAlumnos.agregarMiembro(dodain)
		listaAlumnos.agregarMiembro(deby)
		listaAlumnos.agregarMiembro(fede)
		listaAlumnos.agregarPostObserver(new MailObserver(stubMailSender))
		listaAlumnos.agregarPostObserver(malasPalabrasObserver)

		mensajeAlumno = new Post(alumno, "Hola, queria preguntar que es la recursividad", listaProfes)
		mensajeDodainAlumnos = new Post(dodain,
			"Para explicarte recursividad tendría que explicarte qué es la recursividad", listaAlumnos)
		mensajeDodainProfes = new Post(dodain, "Cuantos TPs hacemos?", listaProfes)
	}

	/*************************************************************/
	/*                     TESTS CON STUBS                       */
	/*************************************************************/
	@Test(expected=typeof(BusinessException))
	def void alumnoNoPuedeEnviarPostAListaProfes() {
		listaProfes.enviar(mensajeAlumno)
	}

	@Test
	def void alumnoPuedeEnviarMailAListaAbierta() {
		Assert::assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
		listaAlumnos.enviar(mensajeAlumno)
		Assert::assertEquals(1, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	@Test
	def void alumnoEnviaMailConMalaPalabra() {
		val mensajeFeo = new Post(alumno, "Cuál es loco! Me tienen podrido", listaAlumnos)
		malasPalabrasObserver.agregarMalaPalabra("podrido")
		listaAlumnos.enviar(mensajeFeo)
		Assert::assertEquals(1, malasPalabrasObserver.mensajesConMalasPalabras.size)
	}

	/*************************************************************/
	/*                     TESTS CON MOCKS                       */
	/*************************************************************/
	@Test
	def void testLista() {
		//creacion de mock
		var mockedMailSender = mock(typeof(StubMailSender))
		listaAlumnos.agregarPostObserver(new MailObserver(mockedMailSender))

		// un alumno envía un mensaje a la lista
		listaAlumnos.enviar(mensajeAlumno)

		//verificacion
		//test de comportamiento, verifico que se enviaron 3 mails
		verify(mockedMailSender, times(3)).send(any(typeof(Mail)))
	}
	
}
