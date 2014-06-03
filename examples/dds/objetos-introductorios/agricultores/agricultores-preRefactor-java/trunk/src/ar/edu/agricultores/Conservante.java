package ar.edu.agricultores;

public class Conservante {

	double precio;
	String descripcion;
	
	/** GETTERS Y SETTERS **/
	public double getPrecio() {
		return precio;
	}
	
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	/** CONSTRUCTOR **/
	public Conservante(double pPrecio, String pDescripcion) {
		this.descripcion = pDescripcion;
		this.precio = pPrecio;
	}
	
}
