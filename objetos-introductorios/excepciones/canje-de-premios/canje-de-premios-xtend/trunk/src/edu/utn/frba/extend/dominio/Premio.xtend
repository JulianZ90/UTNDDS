package edu.utn.frba.extend.dominio

class Premio {
	int valor
	private int nivelPopularidad
	String descripcion
	GestorDeStock gestorDeStock = new GestorDeStock
	
	new(int unValor, String unaDesc, int popularidad){
		this.valor = unValor
		this.descripcion = unaDesc
		this.nivelPopularidad = popularidad
	}
	
	def setGestorDeStock(GestorDeStock gestor){
		gestorDeStock = gestor
	}
	
	def getDescripcion(){
		descripcion
	}
	
	def getGestorDeStock(){
		gestorDeStock
	}
	
	def setConsultorDeStock(GestorDeStock c){
		gestorDeStock = c
	}
	
	def getValor(){
		valor
	}
	
	def getPopularidad(){
		nivelPopularidad
	}
	
	def setPopularidad(int popularidad){
		nivelPopularidad = popularidad
	}
	
	def canjear(){
		gestorDeStock.actualizarStock(this)
		aumentarPopularidad
	}
	
	def aumentarPopularidad(){
		nivelPopularidad = nivelPopularidad + 1
	}
}