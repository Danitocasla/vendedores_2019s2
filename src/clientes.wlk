import vendedores.*

object clienteInseguro {
	method puedeSerAtendidoPor(vendedor) = vendedor.esVersatil() and vendedor.esFirme()
}
object clienteDetallista {
	method puedeSerAtendidoPor(vendedor) = vendedor.totalCertificProd() >= 3
}
object clienteHumanista {
	method puedeSerAtendidoPor(vendedor) = vendedor.esPersonaFisica()
}