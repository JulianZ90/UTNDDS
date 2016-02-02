package edu.utn.frba.mock

import edu.utn.frba.extend.dominio.SqlDBConnector
import edu.utn.frba.extend.excepciones.NoHayConexionException

class SqlDBConnectorFailed extends SqlDBConnector {

	override obtenerConexion() {

		///Error que manejamos en la UI
		throw new NoHayConexionException
	}

}
