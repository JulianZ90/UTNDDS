package org.uqbar.xunit.dsl
import org.uqbar.xunit.AbstractTest



class ClosureBasedTest extends AbstractTest {

	def dynamicProperties = [:]
	
	def beforeBlocks = []
	def afterBlocks = []
	def testBlock
	
	public ClosureBasedTest() {

	}
	@Override
	def before() {
		for (block in beforeBlocks) {
			
			this.with(block)
		}
	}
	
	@Override
	def after() {
		for (block in afterBlocks) {
			this.with(block)
		}
	}

	@Override
	def test() {
		this.with(testBlock);
	}
	
	@Override
	def propertyMissing(String property) {
		dynamicProperties[property]			
	}
	
	@Override
	def propertyMissing(String property, value) {
		dynamicProperties[property] = value
	}
	

	

}
