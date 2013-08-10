package org.uqbar.comunicacion.sharedMemory.globals

import java.util.List
import org.uqbar.comunicacion.Asiento

class Sala {
	public static List<Asiento> asientos = asientosIniciales
	public static boolean empezoLaFuncion = false
	
	def static asientosIniciales (){
		(1..100).map[ Asiento.libre ].toList
	}
}