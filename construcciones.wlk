class Construccion{
    method valor() 
}
class Muralla inherits Construccion {
  const property longitud
  override method valor() = longitud * 10 
}
class Museo inherits Construccion {
  const property superficieCubierta
  const property indiceImportancia
  override method valor() = superficieCubierta * indiceImportancia 
}