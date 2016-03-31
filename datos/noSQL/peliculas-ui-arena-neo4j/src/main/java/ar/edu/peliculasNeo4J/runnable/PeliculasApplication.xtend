package ar.edu.peliculasNeo4J.runnable

import ar.edu.peliculasNeo4J.ui.BuscarPeliculasWindow
import org.uqbar.arena.Application
import ar.edu.peliculasNeo4J.appModel.BuscarPeliculasAppModel

class PeliculasApplication extends Application {
	
	static def void main(String[] args) { 
		new PeliculasApplication().start()
	}

	override createMainWindow() {
		new BuscarPeliculasWindow(this, new BuscarPeliculasAppModel())
	}
	
}