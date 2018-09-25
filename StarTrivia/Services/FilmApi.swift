//
//  FilmApi.swift
//  StarTrivia
//
//  Created by iain Allen on 18/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import Foundation
import Alamofire


class FilmsApi {
    
    func getfilm(url: String, completion: @escaping FilmsResponseCompletion) {
        
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
                let film = try jsonDecoder.decode(Films.self, from: data)
                completion(film)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
}


