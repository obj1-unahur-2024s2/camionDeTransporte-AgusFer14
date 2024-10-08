object knightRider {
    
    method peso() = 500

    method peligrosidad() = 10

}

object bumblebee {
    var modoAuto = true

    method peso() = 800

    method peligrosidad() = if(modoAuto){15} else{30}

    /*method cambiarModo() {
        modoAuto = !modoAuto
    }*/
    method cambiarAAuto() {
        modoAuto = true
    }

    method cambiarARobot() {
        modoAuto = false
    }

    method estaEnModoAuto() = modoAuto
    
}

object paqueteDeLadrillos {
    var property cantidad = 0

    method peso() = cantidad * 2

    method peligrosidad() = 2

}

object arena {
    var property peso = 0

    method peligrosidad() = 1

}

object bateriaAntiaerea {
    var property tieneMisiles = true

    method peso() = if(tieneMisiles){300} else{200}

    method peligrosidad() {
       return if(tieneMisiles){
            100
        } else{
            0
        }
    }

}

object contenedor {
    const cosas = []
    method agregarCosa(unaCosa) = cosas.add(unaCosa)
    method sacarCosa(unaCosa) = cosas.remove(unaCosa)
    method agregarVariasCosas(listaDeCosas) = cosas.addAll(listaDeCosas)

    method peso() = 100 + cosas.sum({c => c.peso()})

    method peligrosidad() = if(cosas.isEmpty()) 0 
        else cosas.max({c => c.peligrosidad()}).peligrosidad() 

}

object residuosRadioactivos {
    var property peso = 0

    method peligrosidad() = 200

}

object embalajeDeSeguridad {
    var property envuelveA = arena

    method peso() = envuelveA.peso()

    method peligrosidad() = envuelveA.peligrosidad() / 2

}