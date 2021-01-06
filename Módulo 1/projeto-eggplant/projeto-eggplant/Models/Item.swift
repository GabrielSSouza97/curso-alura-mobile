//
//  Item.swift
//  projeto-eggplant
//
//  Created by Gabriel Santos Souza on 21/12/20.
//  Copyright © 2020 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
    
    // MARK: - Init
    
    init(nomec: String, caloriasc: Double) {
        self.nome = nomec
        self.calorias = caloriasc
    }
    
    // MARK: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome-key")
        aCoder.encode(calorias, forKey: "calorias-key")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome-key") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias-key")
    }
}
