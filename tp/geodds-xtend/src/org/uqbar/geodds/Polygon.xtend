package org.uqbar.geodds

import java.util.ArrayList
import java.util.List

import static extension org.uqbar.geodds.NumberUtils.*

/**
 * Define una zona conformada por vértices (un conjunto de puntos)<br>
 * <br>
 * <b>Importante:</b> cuando se define una zona no hay que definir el vértice final igual al inicial<br>
 * <br>
 * @author DDS
 */
class Polygon {

	List<Point> surface

	/**
	 * Constructor default, obliga luego a agregar los puntos manualmente mediante el mensaje add(Point point). <br><br>
	 * Para trabajar con un polígono inmutable, no debe usarse este constructor ni el add posterior.<br>
	 */
	new() {
		surface = new ArrayList<Point>
	}

	def add(Point point) {
		surface.add(point)
	}

	/**
	 * Constructor que le pasa un conjunto de puntos que definen el polígono
	 */
	new(List<Point> points) {
		surface = points
	}

	
	/**
	 * Convierte un punto a un polígono conformado inicialmente por este punto. <br>
	 * No compatible con la idea de un polígono inmutable.<br>
	 */
	static def asPolygon(Point point) {
		new Polygon(#[point] as List<Point>)
	}

	/**
	 * Determina si un punto está dentro de un polígono
	 */
	def isInside(Point point) {
		var counter = 0
		var point1 = surface.get(0)
		val N = surface.size
		for (var i = 1; i <= N; i++) {
			var point2 = surface.get(i % N)
			if (point.intersects(point1, point2)) {
				counter++
			}
			point1 = point2;
		}
		counter.even
	}

	/**
	 * Indica si un punto es alguno de los vértices del polígono
	 */
	def pointOnVertex(Point point) {
		surface.contains(point)
	}

}
