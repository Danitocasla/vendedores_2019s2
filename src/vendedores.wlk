import geografia.*

class Vendedor {
	var property certificaciones = []
	
	method esVersatil() {
		return certificaciones.size() >= 3 
			and certificaciones.any({cer=>cer.sobreProductos()})
				and certificaciones.any({cer=>not cer.sobreProductos()})
	}
	method totalPuntos() = certificaciones.sum({cer=>cer.puntos()})
	method esFirme() = self.totalPuntos() >= 30
	method esPersonaFisica() = true
}

class VendedorFijo inherits Vendedor{
	var property ciudad
	
	method puedeTrabajar(unaCiudad) = ciudad == unaCiudad
	method esInfluyente() = false
}

class Viajante inherits Vendedor{
	var property provinciaHabilitada = []
	
	method puedeTrabajar(unaCiudad) = provinciaHabilitada.any({
		prov=>prov == unaCiudad.provincia()
	})
	method esInfluyente() = provinciaHabilitada.sum({
		prov=>prov.poblacion()
	}) >= 10000000
}

class ComercioCorresponsal inherits Vendedor{
	var property sucursales = []
	
	method puedeTrabajar(unaCiudad) = sucursales.any({
		suc=>suc.ciudad() == unaCiudad
	})
	method esInfluyente() {
		return 	sucursales.map({suc=>suc.ciudad()}).asSet().size() >= 5
			or sucursales.map({suc=>suc.ciudad().provincia()}).asSet().size() >= 3
	}
	override method esPersonaFisica() = false
}
class Sucursal {
	var property ciudad
}

class Certificacion {
	var property puntos
	var property sobreProductos
}