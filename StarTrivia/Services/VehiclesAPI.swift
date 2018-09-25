//
//  VehiclesAPI.swift
//  StarTrivia
//
//  Created by iain Allen on 13/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import Foundation
import Alamofire

class VehiclesAPI {
    
    func getVehicles(url: String, completion: @escaping VehiclesResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else { return completion(nil) }
                let jsonDecoder = JSONDecoder()
            do {
                let vehicles = try jsonDecoder.decode(Vehicles.self, from: data)
                completion(vehicles)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
}
