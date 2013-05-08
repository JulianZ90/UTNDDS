package ar.org.uqbar.disenio.teg

class Pais {
	def dado
	def fichas
	
	def ataca(defensor) {
		def tiradaAtacante = this.tirar(true)
		def tiradaDefensor = defensor.tirar(false)
		
		for(def i=0; i< Math.min(tiradaAtacante.size, tiradaDefensor.size); i++) {
			if(tiradaAtacante[i] > tiradaDefensor[i]) {
				this.restarFicha();
			}
			else {
				defensor.restarFicha();
			}
		}
	}
	
	def restarFicha() {
		this.fichas--;
	}
	
	def tirar(boolean esAtacante) {
		def cantidadDeFichas = Math.max((esAtacante ? fichas-1 : fichas), 3);
		def out = []
		for(def i = 0; i< cantidadDeFichas;i++) {
			out.add(dado.tirar());
		}
		out.sort({a, b -> (a > b) ? a : b})
	}
	
}
