//
//  ViewController.swift
//  projeto-eggplant
//
//  Created by Gabriel Santos Souza on 18/12/20.
//  Copyright © 2020 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableViewController: RefeicoesTableViewController?

    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    @IBAction func adicionarAlimento(_ sender: Any) {
        
        guard let nomeRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nomec: nomeRefeicao, felicidadec: felicidade)
        print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        tableViewController?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
}

