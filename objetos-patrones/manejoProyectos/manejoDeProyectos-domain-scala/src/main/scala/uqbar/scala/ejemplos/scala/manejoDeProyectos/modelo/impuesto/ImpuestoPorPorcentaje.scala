package uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.impuesto

class ImpuestoPorPorcentaje (porcentaje : Double){
  
  def costoImpositivo(valor:Double):Double={valor * (1+porcentaje)}

}