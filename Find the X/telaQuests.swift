//
//  telaQuests.swift
//  Find the X
//
//  Created by Student on 12/15/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit
import CoreData

class telaQuests: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewQuests: UITableView!
    
    
    //Mark: teste banco
    
    let contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewQuests.dataSource = self
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        fetchedResultController = getFetcheResultControl()
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
        }catch let error as NSError {
            print("Erro ao buscar tarefas: \(error), \(error.userInfo)")
        }


        // Do any additional setup after loading the view.
    }
    
    // MARK:- PrepareForSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "respotaQuest" {
            let cell = sender as! UITableViewCell
            let indexPath = tableViewQuests.indexPathForCell(cell)
            let questController: telaRespostaQuest = segue.destinationViewController as! telaRespostaQuest
            let quests: Quest = fetchedResultController.objectAtIndexPath(indexPath!) as! Quest
           print("objeto:", quests)
            questController.labeldescQuestCvar = quests.descriQuestC
            questController.labeldescQuestZvar = quests.descriQuestZ
            questController.labelQuestCvar = quests.questC
            questController.labelQuestZvar = quests.questZ
        }
        if segue.identifier == "vaiTelaRespostaQuestX" {
            let cell = sender as! UITableViewCell
            let indexPath = tableViewQuests.indexPathForCell(cell)
            let questController: telaRespostaQuestX = segue.destinationViewController as! telaRespostaQuestX
            let quests: Quest = fetchedResultController.objectAtIndexPath(indexPath!) as! Quest
            print("objeto:", quests)
            questController.labeldescQuestXvar = quests.descriQuestX
            questController.labelQuestXvar = quests.questX
        }
    }
        


    
    //MARK: Retritive Quests
    
    func getFetcheResultControl() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: questFetchRequest(), managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil )
        
        return fetchedResultController
    }
    
    func questFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Quest")
        let sortDescriptor = NSSortDescriptor(key: "descriQuestC", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSelections = fetchedResultController.sections?.count
        return numberOfSelections!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsisection = fetchedResultController.sections?[section].numberOfObjects
        return numberOfRowsisection!
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let quests = fetchedResultController.objectAtIndexPath(indexPath) as! Quest
        cell.textLabel?.text = quests.nomeQuest
        
        return cell
    }
    
    
    // MARK: - TableView Delete
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let manageObject:NSManagedObject = fetchedResultController.objectAtIndexPath(indexPath) as! NSManagedObject
        contexto.deleteObject(manageObject)
        do {
            try contexto.save()
        }catch _ {
            print("Erro ao deletar tarefa")
            
        }
        
    }
    

    
    // MARK: - TableView Refresh

    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableViewQuests.reloadData()
    }
}



   

