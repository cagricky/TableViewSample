//
//  Service.swift
//  CagriInalCandidateCase
//
//  Created by Çağrı  İnal  on 5.12.2021.
//

import Foundation

class ServiceCall {
    static let shared = ServiceCall()
    
    func fetchData(completion: @escaping (Result<MemesModel, Error>) -> Void) {
        
        let url = URL(string: "https://api.imgflip.com/get_memes")
        
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let memes = try decoder.decode(MemesModel.self, from: data)
                completion(.success(memes))
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
