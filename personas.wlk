class Persona{
  var edad
  var recursos = monedas
  var monedas = 20
  method esDestacada() = edad.between(18, 65) || recursos > 30
  method cumplirAnios() {
    edad = edad + 1
  }
  method edad() = edad
  method recursos() = recursos
  method ganarMonedas(cantidad) {
    monedas = monedas + cantidad
  }
  method gastarMonedas(cantidad) {
    monedas = monedas - cantidad
  }
}