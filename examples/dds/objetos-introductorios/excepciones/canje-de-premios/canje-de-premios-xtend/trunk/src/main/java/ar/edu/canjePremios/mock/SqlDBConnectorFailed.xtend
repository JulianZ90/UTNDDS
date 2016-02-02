package ar.edu.canjePremios.mock

import ar.edu.canjePremios.SqlDBConnector
import ar.edu.canjePremios.excepciones.NoHayConexionException

class SqlDBConnectorFailed extends SqlDBConnector {

	override obtenerConexion() {

		///Error que manejamos en la UI
		throw new NoHayConexionException
	}

}
