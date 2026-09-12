object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}
object manzana {
    method nutrientes() = 20
}

object banana {
    method nutrientes() = 30
}

object frutilla {
    method nutrientes() = 10
}

object licuadoDeFrutas{
  var nutrientes = []

  method sumarNutrientes(fruta){
    nutrientes.add(fruta.nutrientes())
  }

  method rendimientoQueOtorga(dosisConsumida) = nutrientes.sum() * dosisConsumida / 1000
}


object aguaSaborizada {
    var bebida = whisky

    method bebidaCombinada(nuevaBebida) {
        bebida = nuevaBebida
    }

    method bebida() {
        return bebida
    }

    method rendimientoQueOtorga(dosisConsumida) =
        self.bebida().rendimientoQueOtorga(dosisConsumida * 0.25) + 1
}


object coctel{

  const bebidas = []

  method agregarBebida(bebida) {
      bebidas.add(bebida)
  }
  method rendimientoQueOtorga(dosisConsumida) {
    var resultado = 1
    bebidas.forEach { bebida => resultado = 
    resultado * bebida.rendimientoQueOtorga(dosisConsumida / bebidas.size())
    }
    return resultado
  }

}