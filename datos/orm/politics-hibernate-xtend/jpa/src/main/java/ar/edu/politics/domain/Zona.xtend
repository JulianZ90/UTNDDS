package ar.edu.politics.domain

import java.util.Set
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
@Entity
@Accessors
class Zona {

	@Id @GeneratedValue
	private Long id
	
	@Column(length=150)
	String descripcion

	@OneToMany(fetch=FetchType.LAZY)	
	Set<Candidato> candidatos = newHashSet
		
	new() {
		
	}
	
	def void validar() {
		if (descripcion == null) {
			throw new UserException("Debe ingresar descripcion")
		}
		if (candidatos.isEmpty) {
			throw new UserException("Debe haber al menos un candidato en la zona")
		}
	}
	
	override toString() {
		descripcion
	}
	
}
