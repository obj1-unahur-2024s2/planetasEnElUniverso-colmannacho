import personas.*
class Planeta {
  const property personas = []
  const construcciones = []
  
  method agregarPersona(unaPersona) {
    personas.add(unaPersona)
  }
  method agregarConstruccion(unaConstruccion) {
    construcciones.add(unaConstruccion)
  }
  method delegacionDiplomatica() {
    return if(self.personasDestacadas().contains(self.habitanteConMasRecursos())) self.personasDestacadas() else self.personasDestacadas() + [self.habitanteConMasRecursos()]
  }
  method personasDestacadas() = personas.filter({c => c.esDestacada()})
  method habitanteConMasRecursos() = personas.max({c => c.recursos()})  
  method esValioso() = construcciones.sum({c => c.valor()}) > 100
}