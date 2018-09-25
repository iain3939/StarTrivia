//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by iain Allen on 13/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    
    var person: Person!
    let api = VehiclesAPI()
    var vehiclesArray = [String]()
    var currentVehicle = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
        vehiclesArray = person.vehicleUrls
        guard let firstVehicle = vehiclesArray.first else { return }
        getVehicles(url: firstVehicle)
        
        nextBtn.isEnabled = vehiclesArray.count > 1
        previousBtn.isEnabled = false
        
       

        // Do any additional setup after loading the view.
    }
    
    func getVehicles(url: String) {
        api.getVehicles(url: url) { (vehicles) in
            if let vehicles = vehicles {
                self.setupView(vehicles: vehicles)
            }
        }
    }
    
    func setupView(vehicles: Vehicles) {
        nameLbl.text = vehicles.name
        modelLbl.text = vehicles.model
        manufacturerLbl.text = vehicles.manufacturer
        costLbl.text = vehicles.cost_in_credits
        lengthLbl.text = vehicles.length
        speedLbl.text = vehicles.max_atmosphering_speed
        crewLbl.text = vehicles.crew
        passengersLbl.text = vehicles.passengers
        
        
        
    }
    

    
    @IBAction func previousClicked(_ sender: Any) {
        currentVehicle -= 1
        print(vehiclesArray[currentVehicle])
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        print(vehiclesArray[currentVehicle])
        setButtonState()
    }
    
    func setButtonState() {
        
        nextBtn.isEnabled = currentVehicle == vehiclesArray.count - 1 ? false : true
        previousBtn.isEnabled = currentVehicle == 0 ? false : true

        
        //        if currentVehicle == 0 {
//            previousBtn.isEnabled = false
//        } else {
//            previousBtn.isEnabled = true
//        }
//        if currentVehicle == vehiclesArray.count - 1 {
//            nextBtn.isEnabled = false
//
//        } else {
//            nextBtn.isEnabled = true
//        }
        
        getVehicles(url: vehiclesArray[currentVehicle])
    }
}
