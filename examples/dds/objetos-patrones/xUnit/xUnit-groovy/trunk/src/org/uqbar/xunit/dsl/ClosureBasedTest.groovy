package org.uqbar.xunit.dsl
import org.uqbar.xunit.AbstractTest



class ClosureBasedTest extends AbstractTest {

	
	def beforeBlocks = []
	def afterBlocks = []
	def testBlock
	def description
	
	public ClosureBasedTest() {

	}
	public ClosureBasedTest(description, testBlock) {
		this.description = description
		this.testBlock = testBlock
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
	def propertyMissing(String property, value) {
		this.metaClass[property] = value
	}
	
	@Override
	public String toString() {
		return description != null ? description : super.toString()
	}

	

}
