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
	method puedeCubrir(unaCiudad) = vendedores.any({ven=>ven.puedeTrabajar(unaCiudad)})
	method vendedoresGenericos() = vendedores.filter({ven=>ven.esGenerico()})
	method esRobusto() = vendedores.filter({ven=>ven.esFirme()}).size() >= 3
	method repartir(certificacion) = vendedores.map({ven=>ven.agregarCer(certificacion)})
	method afinidad(vendedor) {
		if (vendedor.esPersonaFisica()){
			return vendedor.puedeTrabajar(self.ciudad())
		}
		else{
			return vendedor.puedeTrabajar(self.ciudad()) 
				and not self.puedeCubrir(self.ciudad())
		}
	}
	method esCandidato(vendedor) = vendedor.esVersatil() and self.afinidad(vendedor)
}
