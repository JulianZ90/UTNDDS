package ar.edu.seleccionPersonal

abstract class Busqueda {
	List<Postulante> postulantes
	BigDecimal remuneracion
	String sector
	Cargo cargo
	
	public Busqueda() {
		postulantes = []
	}
	
	def postular(Postulante postulante) {
		postulante.validarPostulacion(this)
		this.agregarPostulante(postulante)
	}
	
	def agregarPostulante(Postulante postulante) {
		postulantes.add(postulante)
	}

	def getDescripcionCargo() {
		cargo.descripcion
	}
	
}
