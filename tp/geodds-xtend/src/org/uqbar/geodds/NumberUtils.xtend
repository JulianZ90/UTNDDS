package org.uqbar.geodds

/**
 * Clase helper para números.
 * <br>
 * Se debe importar como <b>static extension methods</b>, eso permite incorporar mensajes
 * a los números de la forma<br>
 * <ul>
 * <li>2.max(5)<br>
 * <li>6.even<br>
 * </ul>
 * etc.<br><br>
 * 
 * @author DDS
 */
class NumberUtils {

	/**
	 * Devuelve el menor valor entre dos números
	 */
	static def double min(double x, double y) {
		if(x < y) x else y
	}

	/**
	 * Devuelve el mayor valor entre dos números
	 */
	static def max(double x, double y) {
		if(x > y) x else y
	}

	/**
	 * Indica si un número es par
	 */
	static def even(int x) {
		x % 2 == 0
	}

}
