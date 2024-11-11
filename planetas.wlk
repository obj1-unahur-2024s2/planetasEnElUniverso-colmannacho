class Planeta {
  const personas = []
  const construcciones = []
  
  method agregarPersona(unaPersona) {
    personas.add(unaPersona)
  }
  method agregarConstruccion(unaConstruccion) {
    construcciones.add(unaConstruccion)
  }
  method delegacionDiplomatica() {
    return 
        if(self.personasDestacadas().contains(self.habianteConMasRecursos())){
            self.personasDestacadas()
        }
        else{
            self.personasDestacadas() ++ [self.habianteConMasRecursos()]
        }
  }
  method personasDestacadas() = personas.filter({c => c.esDestacada()})
  method habianteConMasRecursos() = personas.max({c => c.recursos()})  
  method esValioso() = construcciones.sum({c => c.valor()}) 
}