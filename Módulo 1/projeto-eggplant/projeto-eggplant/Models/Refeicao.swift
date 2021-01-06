//
//  Refeicao.swift
//  projeto-eggplant
//
//  Created by Gabriel Santos Souza on 21/12/20.
//  Copyright © 2020 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    // MARK - Atributos
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    // MARK - Init
    
    init(nomec: String, felicidadec: Int, itensc: [Item] = []) {
        self.nome = nomec
        self.felicidade = felicidadec
        self.itens = itensc
    }
    
    // MARK: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome-key")
        aCoder.encode(felicidade, forKey: "felicidade-key")
        aCoder.encode(itens, forKey: "itens-key")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome-key") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade-key")
        itens = aDecoder.decodeObject(forKey: "itens-key") as! Array<Item>
    }
    
    // MARK - Métodos
    
    func calculaCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome): \(item.calorias) calorias"
        }
        
        return mensagem
    }
}
