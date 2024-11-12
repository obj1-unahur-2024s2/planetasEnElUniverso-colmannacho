class Planeta {
  const property personas = []
  const property construcciones = []
  
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

  method ordenarTrabajarADelegacionDurante_(cantidadTiempo) {
    self.delegacionDiplomatica().forEach({c => c.trabajarEn_Durante_(self,cantidadTiempo)})
  }
  method invadir_Durante_(unPlaneta,cantidadTiempo) {
    unPlaneta.ordenarTrabajarADelegacionDurante_(cantidadTiempo)
  }
}