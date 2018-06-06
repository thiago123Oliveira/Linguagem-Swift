//
//  telaCadastro.swift
//  Find the X
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class telaCadastro: UIViewController {

    @IBOutlet weak var nomeCadastro: UITextField!
    @IBOutlet weak var cidadeCadastro: UITextField!
    @IBOutlet weak var emailsCadastro: UITextField!
    @IBOutlet weak var senhaCadastro: UITextField!
    
    var usuario: Usuario? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if usuario != nil {
            nomeCadastro.text = usuario?.nome
            cidadeCadastro.text = usuario?.cidade
            emailsCadastro.text = usuario?.email
            senhaCadastro.text = usuario?.senha
            usuario?.pontos = 0
            usuario?.questRespondida = 0
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
