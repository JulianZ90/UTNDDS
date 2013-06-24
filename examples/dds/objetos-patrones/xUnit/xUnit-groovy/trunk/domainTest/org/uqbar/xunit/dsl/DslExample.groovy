package org.uqbar.xunit.dsl

import org.uqbar.xunit.all.ConsoleReporter

class DslExample extends DslTest {{
	before { 
		a = 5
	}
	
	test("Test1") {
		assertEquals("esto tenia que ser igual", 5, a)
	}
	
	test("Test2") {
		assertEquals("No se sumo correctamente", 6, a + 1)
	}
	
	after {
		a = null
	}
}}
