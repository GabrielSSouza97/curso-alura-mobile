//
//  ViewController.swift
//  projeto-eggplant
//
//  Created by Gabriel Santos Souza on 18/12/20.
//  Copyright © 2020 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var felicidadeTextField: UITextField!
    
    @IBAction func adicionarAlimento(_ sender: Any) {
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        
        print("Comi \(nome) e fiquei com felicidade:\(felicidade)")
    }
    
}

