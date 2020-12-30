//
//  RefeicaoDao.swift
//  projeto-eggplant
//
//  Created by Gabriel Santos Souza on 26/12/20.
//  Copyright © 2020 Gabriel Santos Souza. All rights reserved.
//

import Foundation

class RefeicaoDao {
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        let caminho = diretorio.appendingPathComponent("refeições")
        
        return caminho
    }
    
    func recupera() -> [Refeicao] {
        guard let caminho = recuperaCaminho() else {
            return []
        }
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else {
                return []
            }
            
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func save(_ refeicoes: [Refeicao]) {
        
        guard let caminho = recuperaCaminho() else {
            return
        }
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
}
