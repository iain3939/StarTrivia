//
//  StarshipsApi.swift
//  StarTrivia
//
//  Created by iain Allen on 18/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import Foundation
import Alamofire

class StarshipsApi {
    
    func getStarshipsUrl(url: String, completion: @escaping StarshipsResponseCompletion) {
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
                let starships = try jsonDecoder.decode(Starships.self, from: data)
                completion(starships)
                
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
                
            }
        }
    }
}
