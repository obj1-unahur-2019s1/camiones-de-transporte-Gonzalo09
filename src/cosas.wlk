object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

class PaqueteDeLadrillos {
	var cantidad = 0
	method cantidadDeLadrillos(ladrillos) {cantidad = ladrillos}
	method peso() { return 2*cantidad }
	method nivelPeligrosidad() { return 2 }
}

object arenaAGranel {
	var peso
	method peso() { return peso }
	method pesoNuevo(kg) { peso = kg }
	method nivelPeligrosidad() { return 1}
}

object bateriaAntiaerea {
	var misiles
	
	method ponerMisiles() {
		misiles = true
	}
	method sacarMisiles() {
		misiles = false
	}
	method peso() {
		if(misiles){ return 300 }
		else { return 200}
	}
	
	method nivelPeligrosidad() {
		if(misiles){ return 100}
		else { return 0 }
	}
}

object contenedorPortuario {
	var cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method peso() {
		return cosas.sum({ obj => obj.peso() }) + 100
	}
	
	method nivelPeligrosidad() {
		if (cosas) { return 0 }
		else { 
			var maximo = cosas.max({ obj => obj.nivelPeligrosidad() })
			return maximo.nivelPeligrosidad()
		}
	}
}

