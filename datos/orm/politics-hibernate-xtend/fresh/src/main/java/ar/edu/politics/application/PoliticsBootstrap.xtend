package ar.edu.politics.application

import ar.edu.politics.domain.Candidato
import ar.edu.politics.domain.Partido
import ar.edu.politics.domain.Peronista
import ar.edu.politics.domain.Preservativo
import ar.edu.politics.domain.Promesa
import ar.edu.politics.domain.Zona
import ar.edu.politics.repos.RepoCandidatos
import ar.edu.politics.repos.RepoPartidos
import ar.edu.politics.repos.RepoZonas
import java.util.Date
import org.uqbar.arena.bootstrap.Bootstrap

class PoliticsBootstrap implements Bootstrap {

	Partido frejuli
	Partido perone
	Partido prime

	Candidato sosa
	Candidato benitez
	Candidato yapura
	Candidato ramos
	Candidato monti
	Candidato rota
	Candidato cafrune

	Zona nacional
	Zona springfield

	def void initPartidos() {
		frejuli = new Peronista => [
			afiliados = 60000
			nombre = "FREJULI"
			populista = true
		]

		perone = new Peronista => [
			afiliados = 5000
			nombre = "Perone"
			populista = false
		]

		prime = new Preservativo => [
			afiliados = 1200
			nombre = "PRIME"
			fechaCreacion = new Date(109, 1, 2)
		]

		this.crearPartidos(frejuli)
		this.crearPartidos(perone)
		this.crearPartidos(prime)
	}

	def void crearPartidos(Partido partido) {
		val repoPartidos = RepoPartidos.instance
		if (repoPartidos.searchByExample(partido).isEmpty) {
			repoPartidos.create(partido)
			println("Partido " + partido.nombre + " creado")
		}
	}

	def void initCandidatos() {
		sosa = new Candidato() => [
			nombre = "Julio Sosa"
			partido = frejuli
			promesas = newArrayList(new Promesa("Terminar con la inseguridad"),
				new Promesa("Aborto para unos, banderitas para otros"))
		]
		benitez = new Candidato() => [
			nombre = "Myriam Benitez"
			partido = frejuli
			promesas = newArrayList(new Promesa("Girar y girar hacia la libertad"))
		]
		yapura = new Candidato() => [
			nombre = "Marcelo Yapura"
			partido = frejuli
			promesas = newArrayList(new Promesa("Terminar con la pobreza"),
				new Promesa("Que todos los docentes de la UTN cobren en euros"))
		]
		ramos = new Candidato() => [
			nombre = "Manuel Ramos"
			partido = perone
			promesas = newArrayList(new Promesa("Terminar con la inseguridad"),
				new Promesa("Recuperar la confianza de los argentinos"))
		]
		monti = new Candidato() => [
			nombre = "Yaco Monti"
			partido = perone
			promesas = newArrayList(new Promesa("Terminar con la inseguridad"), new Promesa("Recuperar la dignidad"))
		]
		rota = new Candidato() => [
			nombre = "Nino Rota"
			partido = prime
			promesas = newArrayList(new Promesa("Ganarle a la pobreza"), new Promesa("Sacar el cepo a la moneda extranjera"),
				new Promesa("Eliminar el impuesto a las ganancias"))
		]
		cafrune = new Candidato() => [
			nombre = "Yamila Cafrune"
			partido = prime
			promesas = newArrayList(new Promesa("Terminar con Futbol para Todos"),
				new Promesa("Privatizar las empresas del estado"), new Promesa("Dolarizar la economia"))
		]
		this.crearCandidato(sosa)
		this.crearCandidato(benitez)
		this.crearCandidato(yapura)
		this.crearCandidato(ramos)
		this.crearCandidato(monti)
		this.crearCandidato(rota)
		this.crearCandidato(cafrune)
	}

	def crearCandidato(Candidato candidato) {
		val repoCandidatos = RepoCandidatos.instance
		if (repoCandidatos.searchByExample(candidato).isEmpty) {
			repoCandidatos.create(candidato)
			println("Candidato " + candidato.nombre + " creado")
		}
	}

	def initZonas() {
		nacional = new Zona => [
			descripcion = "Elecciones nacionales"
			candidatos = newArrayList(sosa, benitez, ramos, rota)
		]
		springfield = new Zona => [
			descripcion = "Springfield"
			candidatos = newArrayList(yapura, monti, cafrune)
		]
		this.crearZona(nacional)
		this.crearZona(springfield)
	}

	def crearZona(Zona zona) {
		val repoZonas = RepoZonas.instance
		if (repoZonas.searchByExample(zona).isEmpty) {
			repoZonas.create(zona)
			println("Zona " + zona.descripcion + " creada")
		}
	}

	override run() {
		initPartidos
		initCandidatos
		initZonas
	}
	
	override isPending() {
		false
	}
	
}
