package ar.edu.peliculasNeo4J.repo

import java.io.File
import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.factory.GraphDatabaseFactory

@Accessors
class GraphDatabaseProvider {

	static GraphDatabaseProvider instance
	
	GraphDatabaseService graphDb
	
	private new() {
		val GraphDatabaseFactory dbFactory = new GraphDatabaseFactory
		graphDb = dbFactory.newEmbeddedDatabase(new File("/home/fernando/apps/neo4j-community-2.3.3/data/graph.db"))
	}
	
	def static instance() {
		if (instance == null) {
			instance = new GraphDatabaseProvider		
		}
		instance
	}
	 	
}