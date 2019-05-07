import cosas.*

class Camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method pesoTotal() {
		return cosas.sum({ obj => obj.peso() }) + 1000
	}
	
	method excedidoDePeso() {
		const pesoMaximo = 2500
		return self.pesoTotal() > pesoMaximo
	}
	
	method objetosPeligrosos(nivel) {
		return cosas.filter({ obj => obj.nivelPeligrosidad() > nivel })
	}
	
	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({ obj => obj.nivelPeligrosidad() > cosa.nivelPeligrosidad() })
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return cosas.all({ obj => obj.nivelPeligrosidad() <= nivelMaximoPeligrosidad })
	}
}