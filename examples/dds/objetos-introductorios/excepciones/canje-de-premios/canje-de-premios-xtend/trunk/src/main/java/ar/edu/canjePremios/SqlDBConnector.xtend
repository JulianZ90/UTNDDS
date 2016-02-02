package ar.edu.canjePremios
import ar.edu.canjePremios.mock.PremioNoDisponible
import java.sql.SQLException

class SqlDBConnector {
	///Este se conectar�a con la base
	def query(Premio unPremio){
		//obtiene la conexion
		obtenerConexion();
		
		//Envia el pedido 
		//En realidad la base genera un raiserror
		switch(unPremio.getClass){
			case typeof(PremioNoDisponible): throw new SQLException
			default: return
		}
	}
	
	def obtenerConexion(){
		///Codigo SQL
	}
}