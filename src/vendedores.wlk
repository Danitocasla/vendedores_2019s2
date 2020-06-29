import geografia.*

class Vendedor {
	var property certificaciones = []
	
	method agregarCer(certificacion) = certificaciones.add(certificacion)
	method esVersatil() {
		return certificaciones.size() >= 3 
			and certificaciones.any({cer=>cer.esSobreProducto()})
				and self.esGenerico()
	}
	method totalPuntos() = certificaciones.sum({cer=>cer.puntos()})
	method esFirme() = self.totalPuntos() >= 30
	method esPersonaFisica() = true
	method esGenerico() = certificaciones.any({cer=>not cer.esSobreProducto()})
	method totalCertificProd() = certificaciones.filter({cer=>cer.esSobreProducto()}).size()
	method puedeTrabajar(unaCiudad)   // method abstracto
	
	method afinidad(centro) {
		if (self.esPersonaFisica()){
			return self.puedeTrabajar(centro.ciudad())
		}
		else{
			return self.puedeTrabajar(centro.ciudad()) 
				and not centro.puedeCubrir(centro.ciudad())
		}
	}
}

class VendedorFijo inherits Vendedor{
	var property ciudad
	
	override method puedeTrabajar(unaCiudad) = ciudad == unaCiudad
	method esInfluyente() = false
}

class Viajante inherits Vendedor{
	var property provinciaHabilitada = []
	
	method agregarProv(provincia) = provinciaHabilitada.add(provincia)
	override method puedeTrabajar(unaCiudad) = provinciaHabilitada.any({
		prov=>prov == unaCiudad.provincia()
	})
	method esInfluyente() = provinciaHabilitada.sum({
		prov=>prov.poblacion()
	}) >= 10000000
}

class ComercioCorresponsal inherits Vendedor{
	var property sucursales = []
	
	method agregarSuc(sucursal) = sucursales.add(sucursal)
	override method puedeTrabajar(unaCiudad) = sucursales.any({
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
	
	method esSobreProducto() = sobreProductos
}