

class Vendedor {
	var property certificaciones = []
	var puntos
	method esVersatil()
	method esFirme()
	method esPersonaFisica() = true
}

class VendedorFijo inherits Vendedor{
	method puedeTrabajar(ciudad)
	method esInfluyente()
}

class Viajante inherits Vendedor{
	method puedeTrabajar(ciudad)
	method esInfluyente()
}

class ComercioCorresponsal inherits Vendedor{
	method puedeTrabajar(ciudad)
	method esInfluyente()
	override method esPersonaFisica() = false
}