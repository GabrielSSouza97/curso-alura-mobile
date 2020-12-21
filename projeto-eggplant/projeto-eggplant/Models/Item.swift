//
//  Item.swift
//  projeto-eggplant
//
//  Created by Gabriel Santos Souza on 21/12/20.
//  Copyright © 2020 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class Item: NSObject {
    let nome: String
    let calorias: Double
    
    init(nomec: String, caloriasc: Double) {
        self.nome = nomec
        self.calorias = caloriasc
    }
}
