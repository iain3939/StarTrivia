//
//  HomeWorldVC.swift
//  StarTrivia
//
//  Created by iain Allen on 13/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import UIKit

class HomeWorldVC: UIViewController, PersonProtocol {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    
    
    var person: Person!
    let api = HomeworldAPI()
    
override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeworld(url: person.homeworlUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setupUI(homeworld: homeworld)
            }
        }

        // Do any additional setup after loading the view.
    }
    

    func setupUI(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }

}
