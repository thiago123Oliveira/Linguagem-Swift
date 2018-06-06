//
//  cadastroQuest.swift
//  Find the X
//
//  Created by Felipe Casseb on 12/16/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class cadastroQuest:  UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    @IBOutlet weak var mapCadastroQuest: MKMapView!
    @IBOutlet weak var nomeQuestTextField: UITextField!
    @IBOutlet weak var descQuestCTextField: UITextField!
    @IBOutlet weak var questCTextField: UITextField!
    @IBOutlet weak var respQuestCTextField: UITextField!
    
    var quests: Quest? = nil
    var nomeQuestvar: String? = nil
    var descriQuestCvar: String? = nil
    var questCvar: String? = nil
    var respQuestCvar: String? = nil
    var descriQuestZvar: String? = nil
    var questZvar: String? = nil
    var respQuestZvar: String? = nil
    var descriQuestXvar: String? = nil
    var questXvar: String? = nil
    var respQuestXvar: String? = nil
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapCadastroQuest.hidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapCadastroQuest.showsUserLocation = true
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude:  location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
        self.mapCadastroQuest.setRegion(region , animated:  true)
        self.locationManager.stopUpdatingLocation()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK:- IBActions
    
    
    func limpaTextField() {
        descQuestCTextField.text = ""
        questCTextField.text = ""
        respQuestCTextField.text = ""
        nomeQuestTextField.hidden = true
        
    }
    
    @IBAction func done(sender: AnyObject) {
        if x == 3 {
            nomeQuestvar = nomeQuestTextField.text
            descriQuestCvar = descQuestCTextField.text
            questCvar = questCTextField.text
            respQuestCvar = respQuestCTextField.text
            limpaTextField()
            descQuestCTextField.placeholder = "Descrição Quest Z"
            questCTextField.placeholder = "Quest Z"
            respQuestCTextField.placeholder = "Resposta Quest Z"
        }
        if x == 2 {
            descriQuestZvar = descQuestCTextField.text
            questZvar = questCTextField.text
            respQuestZvar = respQuestCTextField.text
            limpaTextField()
            mapCadastroQuest.hidden = false
            descQuestCTextField.placeholder = "Descrição Quest X"
            questCTextField.placeholder = "Quest X"
            respQuestCTextField.placeholder = "Resposta Quest X"
        }
        if x == 1 {
            descriQuestXvar = descQuestCTextField.text
            questXvar = questCTextField.text
            respQuestXvar = respQuestCTextField.text
            createQuest()
            x = 4
            dismissViewController()
        }
        x = x-1

        
    }

    @IBAction func cancel(sender: AnyObject) {
        dismissViewController()
    }
    
    
    // MARK:- Dismiss ViewControllers
    
    func dismissViewController() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK:- Create Quest
    
   
    func save() {
        do {
            try contexto.save()
            
        }catch let error as NSError {
            print("Erro ao criar tarefa")
            print(error)
        }
    }
    
    var x = 3
    
    func createQuest() {
        //TODO
        let entityDescription = NSEntityDescription.entityForName("Quest",inManagedObjectContext : contexto)
        let questsTeste = Quest(entity: entityDescription!, insertIntoManagedObjectContext: contexto)
        
        //preencher os atributos do objeto task a partir dos campos em que o usuário digitou
        questsTeste.nomeQuest = nomeQuestvar
        questsTeste.descriQuestC = descriQuestCvar
        questsTeste.questC = questCvar
        questsTeste.respQuestC = respQuestCvar
        questsTeste.descriQuestZ = descriQuestZvar
        questsTeste.questZ = questZvar
        questsTeste.respQuestZ = respQuestZvar
        questsTeste.descriQuestX = descriQuestXvar
        questsTeste.questX = questXvar
        questsTeste.respQuestX = respQuestXvar
        do {
            try contexto.save()
            
        }catch let error as NSError {
            print("Erro ao criar tarefa")
            print(error)
        }
    }

}
