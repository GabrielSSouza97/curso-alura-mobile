//
//  Refeicao.swift
//  projeto-eggplant
//
//  Created by Gabriel Santos Souza on 21/12/20.
//  Copyright © 2020 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    // MARK - Atributos
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    
    // MARK - Construtor
    init(nomec: String, felicidadec: Int) {
        self.nome = nomec
        self.felicidade = felicidadec
    }
    
    // MARK - Métodos
    func calculaCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
}
