//
//  Constants.swift
//  StarTrivia
//
//  Created by iain Allen on 07/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import UIKit

let blackBg = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void
typealias VehiclesResponseCompletion = (Vehicles?) -> Void
typealias StarshipsResponseCompletion = (Starships?) -> Void
typealias FilmsResponseCompletion = (Films?) -> Void


