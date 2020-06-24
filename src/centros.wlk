import vendedores.*
import geografia.*
import clientes.*

class Centros {
	const property ciudad
	var property vendedores = []
	
	method yaEsta(vendedor) = vendedores.any({ven=>ven == vendedor})
	method agregarA(vendedor) = if(self.yaEsta(vendedor)) {
		self.error("Ya se encuentra en la lista")
	}
		else { vendedores.add(vendedor) }
	method vendedorEstrella() = vendedores.max({ven=>ven.totalPuntos()})
	method puedeCubrir(unaCiudad)
	method vendedoresGenericos()
	method esRobusto()
	method repartir(certificacion)
	method afinidad(vendedor)
	method esCandidato(vendedor)
}
