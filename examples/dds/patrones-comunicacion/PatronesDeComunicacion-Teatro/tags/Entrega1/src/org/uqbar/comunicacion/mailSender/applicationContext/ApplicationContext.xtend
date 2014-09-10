package org.uqbar.comunicacion.mailSender.applicationContext

import java.util.HashMap

class ApplicationContext {
	static val registry = new HashMap<Class<?>, Object>
	
	static def registerGlobal(Class<?> key, Object singleton) {
		registry.put(key, singleton)
	} 
	
	static def <T> T global(Class<T> key) {
		val singleton = registry.get(key)
		if (singleton == null) throw new UnexistentGlobalObjectException
		return singleton as T
	}
	
	static def reset() {
		registry.clear
	}
}

class UnexistentGlobalObjectException extends RuntimeException {
	
}