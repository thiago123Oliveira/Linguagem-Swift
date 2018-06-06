//
//  telaRespostaQuestX.swift
//  Find the X
//
//  Created by Felipe Casseb on 12/18/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class telaRespostaQuestX: UIViewController {

   
    @IBOutlet weak var labelDescQuestX: UILabel!
    @IBOutlet weak var labelRespostaQuestXTextField: UITextField!
    @IBOutlet weak var labelQuestX: UILabel!
    @IBOutlet weak var mapTelaRespostaQuestX: MKMapView!
    
    var labeldescQuestXvar: String!
    var labelQuestXvar: String!
    var labelrespQuestXvar: String!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //labelDescQuestX.text = labeldescQuestXvar
        //labelQuestX.text = labelQuestXvar
        //labelRespostaQuestXTextField.text = labelrespQuestXvar
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
            if segue.identifier == "vaiTelaRespostaQuestX" {
            let cell = sender as! UITableViewCell
            let indexPath = tableViewQuests.indexPathForCell(cell)
            let questController: telaRespostaQuestX = segue.destinationViewController as! telaRespostaQuestX
            let quests: Quest = fetchedResultController.objectAtIndexPath(indexPath!) as! Quest
            print("objeto:", quests)
            questController.labeldescQuestXvar = quests.descriQuestX
            questController.labelQuestXvar = quests.questX
        }
    }*/


}
