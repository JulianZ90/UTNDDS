package org.uqbar.comunicacion

import java.util.Random

class Extensions {
	static val random = new Random

	static def <T> anyOne(Iterable<T> collection) {
		collection.get(random.nextInt(collection.size))
	}
}
