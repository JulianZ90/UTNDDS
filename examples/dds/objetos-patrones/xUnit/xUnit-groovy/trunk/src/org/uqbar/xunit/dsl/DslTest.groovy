package org.uqbar.xunit.dsl

import org.uqbar.xunit.CompositeTest;
import org.uqbar.xunit.Reporter;
import org.uqbar.xunit.all.ConsoleReporter

class DslTest {

	def befores = []
	def afters = []
	def tests = [:]
	
	def before(Closure before) {
		befores.add(before)
		this
	}
	
	def test(String nombre, Closure test) {
		tests.put(nombre, test)
		this
	}
	
	def after(Closure after) {
		afters.add(after)
		this
	}
	
	def build() {
		CompositeTest output = new CompositeTest()
		tests.each {key, value ->
			output.addTest(new ClosureBasedTest(description:key, 
												testBlock:value, 
												beforeBlocks:befores,
												afterBlocks:afters))
		}
		output
	}
	
	def run(Reporter reporter) {
		this.build().run(reporter)		
	}

	def static run(reporter = new ConsoleReporter(), bloque) {
		new DslTest().with(bloque).run(reporter)
	}
}
