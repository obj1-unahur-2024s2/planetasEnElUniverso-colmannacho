import construcciones.*

class Persona{
  var edad
  var monedas = 20
  method esDestacada() = edad.between(18, 65) || self.recursos() > 30
  method cumplirAnios() {
    edad = edad + 1
  }
  method edad() = edad
  method recursos() = monedas
  method ganarMonedas(cantidad) {
    monedas = monedas + cantidad
  }
  method gastarMonedas(cantidad) {
    monedas = 0.max(monedas - cantidad)
  }
  method trabajarEn_Durante_(unPlaneta,tiempo){}
}
class Productor inherits Persona{
  const tecnicas = []
  method initialize(){
    tecnicas.add("cultivo")
  }
  override method recursos() = super() * tecnicas.size()
  override method esDestacada() = super() or tecnicas.size() > 5
  method realizarTecnica(tecnica,cantidadTiempo) {
    if(tecnicas.contains(tecnica)){
      self.ganarMonedas(cantidadTiempo * 3)
    }
    else{
      self.gastarMonedas(1)
    }
  }
  method aprender(unaTecnica) {
    tecnicas.add(unaTecnica)
  }
  override method trabajarEn_Durante_(unPlaneta,tiempo) {
    if(unPlaneta.personas().contains(self))
      self.realizarTecnica(tecnicas.last(),tiempo)
  }
}
class Constructor inherits Persona{
  var cantidadConstrucciones = 0
  const region
  const inteligencia
  override method recursos() = super() + cantidadConstrucciones * 10
  override method esDestacada() = cantidadConstrucciones > 5

  override method trabajarEn_Durante_(unPlaneta,tiempo){
    cantidadConstrucciones = cantidadConstrucciones + 1
    self.gastarMonedas(5)
    if(region == "montaña") {
      unPlaneta.agregarConstruccion(new Muralla(longitud = tiempo * 0.5))
    }
    else if(region == "costa"){
      unPlaneta.agregarConstruccion(new Museo(superficieCubierta = tiempo,indiceImportancia = 1))
    }
    else if(region == "llanura") {
      if(self.esDestacada()){
        unPlaneta.agregarConstruccion(new Museo(superficieCubierta = tiempo, indiceImportancia = if(self.recursos() >= 50) 5 else self.recursos() * 0.1))
      }
      else {
        unPlaneta.agregarConstruccion(new Muralla(longitud = tiempo * 0.5))
      }
    }
    else if(region == "rocosa"){
      if(inteligencia > 10){
        unPlaneta.agregarConstruccion(new Muralla(longitud = 50))
      }
      else{
        unPlaneta.agregarConstruccion(new Muralla (longitud = 10))
      }
    }
  }
}