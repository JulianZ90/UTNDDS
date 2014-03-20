package ar.edu.telefonia.ui

import ar.edu.telefonia.appModel.BuscarAbonadoAppModel
import ar.edu.telefonia.domain.Abonado
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class AbonadoWindow extends SimpleWindow<BuscarAbonadoAppModel> {
	
	new(WindowOwner parent, BuscarAbonadoAppModel model) {
		super(parent, model)
		title = "Busqueda de abonados"
		taskDescription = "Seleccione el criterio de búsqueda"
	}

	override def createMainTemplate(Panel mainPanel) {
		super.createMainTemplate(mainPanel)
		this.createResultsGrid(mainPanel)
		this.createGridActions(mainPanel)
	}

	/** El panel permite buscar por rango desde/hasta nombre y morosos */	
	override def void createFormPanel(Panel mainPanel) {
		var searchFormPanel = new Panel(mainPanel)
		searchFormPanel.setLayout(new ColumnLayout(2))

		crearTextBox(searchFormPanel, "Nombre desde", "busquedaAbonados.nombreDesde")
		crearTextBox(searchFormPanel, "Nombre hasta", "busquedaAbonados.nombreHasta")
	}

	def crearTextBox(Panel searchFormPanel, String label, String binding) {
		var labelNumero = new Label(searchFormPanel)
		labelNumero.text = label
		val textBox = new TextBox(searchFormPanel)
		textBox.bindValueToProperty(binding)
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel)
			.setCaption("Buscar")
			.onClick [ | modelObject.buscar ] 
			.setAsDefault
			.disableOnError

		new Button(actionsPanel) //
			.setCaption("Limpiar")
			.onClick [ | modelObject.limpiar ]

//		new Button(actionsPanel) //
//			.setCaption("Nuevo Celular")
//			.onClick [ | this.crearCelular ]
	}

	def protected createResultsGrid(Panel mainPanel) {
		var table = new Table<Abonado>(mainPanel, Abonado)
		table.heigth = 200
		table.width = 450
		table.bindItemsToProperty("abonados")
		table.bindValueToProperty("abonadoSeleccionado")
		this.describeResultsGrid(table)
	}

	/**
	 * Define las columnas de la grilla Cada columna se puede bindear 1) contra una propiedad del model, como
	 * en el caso del número o el nombre 2) contra un transformer que recibe el model y devuelve un tipo
	 * (generalmente String), como en el caso de Recibe Resumen de Cuenta
	 *
	 * @param table
	 */
	def void describeResultsGrid(Table<Abonado> table) {
		new Column<Abonado>(table) //
			.setTitle("Nombre")
			.setFixedSize(150)
			.bindContentsToProperty("nombre")

		new Column<Abonado>(table) //
			.setTitle("Número")
			.setFixedSize(100)
			.bindContentsToProperty("numero")
	}

	def void createGridActions(Panel mainPanel) {
//		var actionsPanel = new Panel(mainPanel)
//		actionsPanel.setLayout(new HorizontalLayout)
//		var edit = new Button(actionsPanel)
//			.setCaption("Editar")
//			.onClick [ | this.modificarCelular]
//
//		var remove = new Button(actionsPanel)
//			.setCaption("Borrar")
//			.onClick [ | modelObject.eliminarCelularSeleccionado]
// 
//		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
//		var elementSelected = new NotNullObservable("celularSeleccionado")
//		remove.bindEnabled(elementSelected)
//		edit.bindEnabled(elementSelected)
	}
	
}