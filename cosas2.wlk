object knightRider {
    
    method peso() = 500

    method peligrosidad() = 10

    method bultos() = 1 

    method consecuenciaDeCarga() {}

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

    method bultos() = 2

    method consecuenciaDeCarga() {self.cambiarARobot()}
    
}

object paqueteDeLadrillos {
    var property cantidad = 0

    method peso() = cantidad * 2

    method peligrosidad() = 2

    method bultos() = if(cantidad.between(1, 100)) {1} 
        else if(cantidad.between(101, 300)) {2}
        else {3}

    method consecuenciaDeCarga() {cantidad += 12}

}

object arena {
    var property peso = 0

    method peligrosidad() = 1

    method bultos() = 1

    method consecuenciaDeCarga() {peso = 0.max(peso - 10)}

}

object bateriaAntiaerea {
    var property tieneMisiles = false

    method peso() = if(tieneMisiles){300} else{200}

    method peligrosidad() {
       return if(tieneMisiles){
            100
        } else{
            0
        }
    }

    method bultos() = if(tieneMisiles) 2 else 1 

    method consecuenciaDeCarga() {self.tieneMisiles(true)}

}

object contenedor {
    const cosas = []
    method agregarCosa(unaCosa) = cosas.add(unaCosa)
    method sacarCosa(unaCosa) = cosas.remove(unaCosa)
    method agregarVariasCosas(listaDeCosas) = cosas.addAll(listaDeCosas)

    method peso() = 100 + cosas.sum({c => c.peso()})

    method peligrosidad() = if(cosas.isEmpty()) 0 
        else cosas.max({c => c.peligrosidad()}).peligrosidad()

    method bultos() = 1 + cosas.sum({c => c.bultos()}) 

    method consecuenciaDeCarga() {cosas.forEach({c => c.consecuenciaDeCarga()})}

}

object residuosRadioactivos {
    var property peso = 0

    method peligrosidad() = 200

    method bultos() = 1

    method consecuenciaDeCarga() {peso += 15}

}

object embalajeDeSeguridad {
    var property envuelveA = arena

    method peso() = envuelveA.peso()

    method peligrosidad() = envuelveA.peligrosidad() / 2

    method bultos() = 2

    method consecuenciaDeCarga() {}

}