package org.uqbar.xunit

interface Reporter {
	def success(Test test)
	def failure(Test test)
}
