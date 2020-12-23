//
//  ViewController.swift
//  projeto-eggplant
//
//  Created by Gabriel Santos Souza on 18/12/20.
//  Copyright © 2020 Gabriel Santos Souza. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nomec: "Molho de Tomate", caloriasc: 40.5),
                         Item(nomec: "Queijo", caloriasc: 20.0),
                         Item(nomec: "Pimenta", caloriasc: 15.5),
                         Item(nomec: "Manjericão", caloriasc: 30.0)]
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets

    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaTabela = indexPath.row
        let item = itens[linhaTabela]
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            let linhaTabela = indexPath.row
            itensSelecionados.append(itens[linhaTabela])
        } else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionarAlimento(_ sender: Any) {
        
        guard let nomeRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nomec: nomeRefeicao, felicidadec: felicidade, itensc: itensSelecionados)
        print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
}

