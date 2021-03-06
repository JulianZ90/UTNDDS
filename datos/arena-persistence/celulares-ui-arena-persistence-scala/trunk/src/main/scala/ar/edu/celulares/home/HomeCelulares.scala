package ar.edu.celulares.home

import scala.collection.JavaConversions.asScalaBuffer
import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable
import ar.edu.celulares.domain.Celular
import ar.edu.celulares.domain.Modelo
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.utils.ApplicationContext
import uqbar.arena.persistence.PersistentHome

object HomeCelulares extends PersistentHome[Celular] {
  
//  this.create("Laura Iturbe", 88022202, modelo("NOKIA LUMIA 625"), false)
//  this.create("Julieta Passerini", 45636453, modelo("NOKIA ASHA 501"), false)
//  this.create("Debora Fortini", 45610892, modelo("NOKIA ASHA 501"), true)
//  this.create("Chiara Dodino", 68026976, modelo("NOKIA ASHA 501"), false)
//  this.create("Melina Dodino", 40989911, modelo("LG OPTIMUS L3 II"), true)

  def modelo(modeloDescripcion: String): Modelo = HomeModelos.get(modeloDescripcion)

  // ********************************************************
  // ** Altas y bajas
  // ********************************************************
  def create(pNombre: String, pNumero: Integer, pModeloCelular: Modelo, pRecibeResumenCuenta: Boolean): Unit = {
    var celular = new Celular
    celular.setNombre(pNombre)
    celular.setNumero(pNumero)
    celular.setModeloCelular(pModeloCelular)
    celular.setRecibeResumenCuenta(pRecibeResumenCuenta)
    this.create(celular)
  }

  def validateCreate(celular: Celular) = {
    celular.validar()
    validarClientesDuplicados(celular)
  }

  def validarClientesDuplicados(celular: Celular) = {
    val numero: Integer = celular.getNumero
    if (!this.search(numero).isEmpty) {
      throw new UserException("Ya existe un celular con el número: " + numero)
    }
  }

  // ********************************************************
  // ** Búsquedas
  // ********************************************************
  /**
   * Busca los celulares que coincidan con los datos recibidos. Tanto número como nombre pueden ser nulos,
   * en ese caso no se filtra por ese atributo.
   *
   * Soporta búsquedas por substring, por ejemplo el celular (12345, "Juan Gonzalez") será contemplado por
   * la búsqueda (23, "Gonza")
   */
  def search(numero: Integer, nombre: String = null) = 
    celulares.filter { celular => this.coincide(numero, celular.getNumero) && this.coincide(nombre, celular.getNombre) }

  def coincide(expectedValue: Any, realValue: Any): Boolean = {
    if (expectedValue == null) {
      return true
    }
    if (realValue == null) {
      return false
    }
    return realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
  }

  override def getEntityType = classOf[Celular]

  override def createExample = new Celular

  def celulares: Seq[Celular] = allInstances

  def get(nombre: String) =
    celulares.find(_.getNombre == nombre).getOrElse(null) // Acá hay que pensar algo.

  /**
   * Para el proyecto web - se mantiene la busqueda por Identificador
   */
  override def searchById(id: Int) = {
    celulares.find(_.getId.equals(id)).getOrElse(null)
  }

}