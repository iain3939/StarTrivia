//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by iain Allen on 13/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var hyperdriveLbl: UILabel!
    @IBOutlet weak var classLbl: UILabel!
    @IBOutlet weak var prevousBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    var person: Person!
    let api = StarshipsApi()
    var starshipsArray = [String]()
    var currentStarship = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
        starshipsArray = person.starshipUrls
        prevousBtn.isEnabled = false
        nextBtn.isEnabled = starshipsArray.count > 1
        guard let firstStarship = starshipsArray.first else { return }
        
        getStarships(url: firstStarship)
        
        
        
    }
    
    func getStarships(url: String) {
        api.getStarshipsUrl(url: url) { (starships) in
            if let starships = starships {
                self.setupView(starships: starships)
            }
        }
    }
    
    
    
    func setupView(starships: Starships) {
        nameLbl.text = starships.name
        modelLbl.text = starships.model
        makerLbl.text = starships.manufacturer
        costLbl.text = starships.cost_in_credits
        lengthLbl.text = starships.length
        speedLbl.text = starships.max_atmosphering_speed
        crewLbl.text = starships.crew
        passengersLbl.text = starships.passengers
        hyperdriveLbl.text = starships.hyperdrive_rating
        classLbl.text = starships.starship_class
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starshipsArray.count - 1 ? false : true
        prevousBtn.isEnabled = currentStarship == 0 ? false : true
        
        getStarships(url: starshipsArray[currentStarship])
    }
    
    
    
    @IBAction func previousBtnClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
        print(starshipsArray[currentStarship])
        
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
        print(starshipsArray[currentStarship])
        
    }
}
