object camion {
    const carga = [] 

    method cargar(cosa) { carga.add(cosa)  
        cosa.consecuenciaDeCarga()
    }
    method cargarVariasCosas(listaDeCosas) {carga.addAll(listaDeCosas)
        listaDeCosas.forEach({c => c.consecuenciaDeCarga()})
    }

    method descargar1CosaDelCamion(cosa) = carga.remove(cosa)

    method pesoDelCamion() = 1000 + carga.sum({c => c.peso()}) 

    method pesosDeLasCosas() = carga.map({c => c.peso()})

    method pesoDeLasCosasCargadas() = self.pesosDeLasCosas().all({c => c.odd()})

    method hayAlgoQuePesa(peso) = carga.any({c => c.peso() == peso})

    method controlDePeligro(nivel) = carga.find({c => c.peligrosidad()})

    method cosasQueSuperanPeligrosidadDe(nivel) = carga.filter({c => c.peligrosidad() > nivel})

    method cosaMasPeligrosaQue(unaCosa) = carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})

    method estaExcedidoDePeso() = self.pesoDelCamion() > 2500

    method puedeCircularEnRuta(unNivel) =
        not self.estaExcedidoDePeso() and self.cosasQueSuperanPeligrosidadDe(unNivel).isEmpty()

    method tieneAlgoQuePesaEntre(valorMinimo, valorMaximo) = 
        carga.any({c => c.peso().between(valorMinimo, valorMaximo)})

    method cosasMasPesadasCargadas() = carga.max({c => c.peso()})
}