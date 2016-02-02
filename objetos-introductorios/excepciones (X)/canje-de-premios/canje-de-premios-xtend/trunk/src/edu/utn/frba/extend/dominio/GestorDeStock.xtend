package edu.utn.frba.extend.dominio

import java.sql.SQLException
import edu.utn.frba.extend.excepciones.NoHayStockException

class GestorDeStock {
	SqlDBConnector sqlDBConnector = new SqlDBConnector

	def setSqlDBConnector(SqlDBConnector conn) {
		sqlDBConnector = conn
	}

	def actualizarStock(Premio unPremio) {

		/////Este armaría la query con los parametros necesarios para 
		////llamar al sqlDBConnector
		try {

			//En realidad este pasaria la query
			sqlDBConnector.query(unPremio)
		} catch (SQLException e) {

			///Con un sp tire raiserror y me llego un SQLException
			///Wrap de la excepcion
			throw new NoHayStockException("No hay suficiente stock del producto " + unPremio.descripcion, e)
		}
	}
}
