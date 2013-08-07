package org.uqbar.comunicacion.sharedMemory.globals

import java.util.List
import org.uqbar.comunicacion.sharedMemory.singleton.Asiento

class GlobalSala {
	public static List<Asiento> asientos = asientosIniciales
	public static boolean estaEmpezada = false
	
	def static asientosIniciales (){
		(1..100).map[ Asiento.libre ].toList
	}
	
	
}