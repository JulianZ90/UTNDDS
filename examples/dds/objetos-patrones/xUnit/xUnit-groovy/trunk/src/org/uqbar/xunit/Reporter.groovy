package org.uqbar.xunit

interface Reporter {
	def success(Test test)
	def error(Test test, Exception ex)
	def failure(Test test, String message)
}
