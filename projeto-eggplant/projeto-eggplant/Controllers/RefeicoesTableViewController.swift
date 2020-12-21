//
//  RefeicoesTableViewController.swift
//  projeto-eggplant
//
//  Created by Gabriel Santos Souza on 21/12/20.
//  Copyright © 2020 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    
    let refeicoes = [Refeicao(nomec: "Macarrão", felicidadec: 4),
                     Refeicao(nomec: "Pizza", felicidadec: 5),
                     Refeicao(nomec: "Comida Japonesa", felicidadec: 2)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
}