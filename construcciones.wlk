class Construccion{
    method valor() 
}
class Muralla inherits Construccion {
  const longitud
  override method valor() = longitud * 10 
}
class Museo inherits Construccion {
  const superficieCubierta
  const indiceImportancia
  override method valor() = superficieCubierta * indiceImportancia 
}