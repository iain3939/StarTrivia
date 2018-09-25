//
//  Person.swift
//  StarTrivia
//
//  Created by iain Allen on 10/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import Foundation

struct Person: Codable {
    
    let name: String
    let height :String
    let mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeworlUrl: String
    let filmUrls: [String]
    let vehicleUrls: [String]
    let starshipUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworlUrl = "homeworld"
        case filmUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
    }
}
