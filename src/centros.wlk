import vendedores.*
import geografia.*
import clientes.*

class Centros {
	var property ciudad
	var property vendedores = []
	
	method yaEsta(vendedor) = vendedores.any({ven=>ven == vendedor}) // method aux
	
	method agregarA(vendedor) = if(self.yaEsta(vendedor)) {
		self.error("Ya se encuentra en la lista")
	}
		else { vendedores.add(vendedor) }
	method vendedorEstrella() {
		return if (vendedores.isEmpty()) {self.error("No hay vendedores en el centro")} else {vendedores.max({ven=>ven.totalPuntos()})}
			}
	method puedeCubrir(unaCiudad) = vendedores.any({ven=>ven.puedeTrabajar(unaCiudad)})
	method vendedoresGenericos() = vendedores.filter({ven=>ven.esGenerico()})
	method esRobusto() = vendedores.filter({ven=>ven.esFirme()}).size() >= 3
	method repartir(certificacion) { return vendedores.forEach({ven=>ven.agregarCer(certificacion)}) }
	
	method esCandidato(vendedor) = vendedor.esVersatil() and vendedor.afinidad(self)
}
