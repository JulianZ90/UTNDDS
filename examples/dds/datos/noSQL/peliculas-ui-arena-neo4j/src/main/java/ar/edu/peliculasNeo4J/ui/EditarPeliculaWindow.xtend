package ar.edu.peliculasNeo4J.ui

import ar.edu.peliculasNeo4J.appModel.EditarPelicula
import ar.edu.peliculasNeo4J.domain.Actor
import ar.edu.peliculasNeo4J.domain.Pelicula
import ar.edu.peliculasNeo4J.domain.Personaje
import ar.edu.peliculasNeo4J.repo.RepoPeliculas
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.ApplicationContext

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarPeliculaWindow extends Dialog<EditarPelicula> {

	new(WindowOwner owner, EditarPelicula editarPelicula) {
		super(owner, editarPelicula)
		if (editarPelicula.modoAlta) {
			title = "Nueva pelicula"
		} else {
			title = "Editar datos de la pelicula"
		}
	}

	override createMainTemplate(Panel mainPanel) {
		mainPanel.layout = new HorizontalLayout
		val panelIzquierdo = new Panel(mainPanel)
		super.createMainTemplate(panelIzquierdo)
		this.createResultsGrid(mainPanel)
	}

	override protected createFormPanel(Panel panelIzquierdo) {
		val form = new Panel(panelIzquierdo)
		form.layout = new ColumnLayout(2)
		new Label(form).text = "Título"
		new TextBox(form) => [
			value <=> "pelicula.titulo"
			width = 250
		]

		new Label(form).text = "Frase"
		new TextBox(form) => [
			value <=> "pelicula.frase"
			width = 250
		]
		new Label(form).text = "Año"
		new NumericField(form) => [
			value <=> "pelicula.anio"
			width = 90
		]
	}

	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|
				modelObject.aceptar
				this.accept
			]
			setAsDefault
			disableOnError
		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|
				this.cancel
			]
		]

	}

	def protected createResultsGrid(Panel mainPanel) {
		val panelDerecho = new Panel(mainPanel)
		// Llevar a otra pantalla los personajes
		new Label(mainPanel) => [
			value <=> "pelicula.id"
		]
		val table = new Table<Personaje>(panelDerecho, typeof(Personaje)) => [
			numberVisibleRows = 5
			width = 650
			// No refresca los personajes en la edición 
			items <=> "pelicula.personajes"
			value <=> "personajeSeleccionado"
		]
		this.buildColumn(table, "Roles", 250, "rolesMostrables")
		this.buildColumn(table, "Actor", 250, "actor.nombreCompleto")
		// Falta el borrado
		
		val panelNuevoPersonaje = new Panel(panelDerecho)
		panelNuevoPersonaje.layout = new HorizontalLayout
		val filaRoles = new Panel(panelNuevoPersonaje)
		new Label(filaRoles).text = "Roles"
		new TextBox(filaRoles) => [
			width = 130
			value <=> "rolesPersonaje"
		]
		val filaActores = new Panel(panelNuevoPersonaje)
		new Label(filaActores).text = "Actor"
		new Selector<Actor>(filaActores) => [
			value <=> "actorPersonaje"
			items <=> "actores"
		]
		val filaAgregar = new Panel(panelNuevoPersonaje)
		new Button(filaAgregar) => [
			caption = "Agregar personaje"
			onClick [ | modelObject.agregarPersonaje ]
		]
	}

	/**
	 * Define las columnas de la grilla Cada columna se puede bindear 1) contra una propiedad del model, como
	 * en el caso del número o el nombre 2) contra un transformer que recibe el model y devuelve un tipo
	 * (generalmente String), como en el caso de Recibe Resumen de Cuenta
	 *
	 * @param table
	 */
	def void buildColumn(Table _table, String _title, int _fixedSize, String _bindedField) {
		new Column(_table) => [
			title = _title
			fixedSize = _fixedSize
			bindContentsToProperty(_bindedField)
		]
	}

	def getRepoPeliculas() {
		ApplicationContext.instance.getSingleton(typeof(Pelicula)) as RepoPeliculas
	}

}
