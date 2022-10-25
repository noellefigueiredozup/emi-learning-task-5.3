//
//  Contador.swift
//  LearningTask-5.3
//
//  Created by Noelle Figueiredo on 25/10/22.
//

import Foundation

struct Contador {
    private(set) var numeroAtual = 0
    private(set) var incremento = 1
    
    mutating func mudaIncremento(novoIncremento: Int) {
        incremento = novoIncremento
    }
    
    mutating func incrementa() {
        numeroAtual += incremento
    }
    
    mutating func decrementa() {
        numeroAtual -= incremento
    }
    
    mutating func reinicia() {
        self = Contador()
    }
    
    func ehNegativo() -> Bool {
        return numeroAtual < 0;
    }
}
