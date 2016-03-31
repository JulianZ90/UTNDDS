package ar.edu.peliculasNeo4J.repo

import ar.edu.peliculasNeo4J.domain.Pelicula
import java.io.File
import java.util.ArrayList
import java.util.Iterator
import java.util.List
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.Node
import org.neo4j.graphdb.Result
import org.neo4j.graphdb.factory.GraphDatabaseFactory
import org.neo4j.helpers.collection.IteratorUtil

class RepoPeliculas {

	GraphDatabaseService graphDb

	def static void main(String[] args) {
		new RepoPeliculas => [
			getPeliculas("Fros")
		]
	}

	new() {
		val GraphDatabaseFactory dbFactory = new GraphDatabaseFactory
		graphDb = dbFactory.newEmbeddedDatabase(new File("/home/fernando/apps/neo4j-community-2.3.3/data/graph.db"))
	}

	def List<Pelicula> getPeliculas(String valor) {
		graphDb.beginTx
		val Result result = graphDb.execute("match (peli:Movie) where peli.title =~ '(?i).*" + valor + ".*' return peli")
		val List<Pelicula> peliculas = new ArrayList<Pelicula>
		val Iterator<Node> peli_column = result.columnAs("peli")
		for (Node node : IteratorUtil.asIterable(peli_column)) {
			val pelicula = new Pelicula => [
				titulo = node.getProperty("title") as String
				
				frase = node.getProperty("tagline", "") as String
				val released = node.getProperty("released") as Long
				if (released != null) {
					anio = released.intValue
				}
			]
			peliculas.add(pelicula)

		}
		peliculas
	}
}
