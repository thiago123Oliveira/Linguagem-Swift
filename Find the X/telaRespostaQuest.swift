//
//  telaRespostaQuest.swift
//  Find the X
//
//  Created by Felipe Casseb on 12/17/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class telaRespostaQuest: UIViewController {
    
    
    @IBOutlet weak var labelDescQuestC: UILabel!
    @IBOutlet weak var labelDescQuestZ: UILabel!
    @IBOutlet weak var labelQuestC: UILabel!
    @IBOutlet weak var labelQuestZ: UILabel!
    @IBOutlet weak var respostaQuestCTextField: UITextField!
    @IBOutlet weak var respostaQuestZTextField: UITextField!
    
    var labelQuestCvar: String!
    var labelQuestZvar: String!
    var labeldescQuestCvar: String!
    var labeldescQuestZvar: String!


    override func viewDidLoad() {
        super.viewDidLoad()
        labelQuestC.text = labelQuestCvar
        labelQuestZ.text = labelQuestZvar
        labelDescQuestC.text = labeldescQuestCvar
        labelDescQuestZ.text = labeldescQuestZvar


        // Do any additional setup after loading the view.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
