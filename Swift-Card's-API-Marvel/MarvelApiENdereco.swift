//
//  MarvelApiENdereco.swift
//  Swift-Card's-API-Marvel
//
//  Created by Luccas Santana Marinho on 03/04/22.
//

import Foundation

class MarvelApiENdereco {
    class func servicoApi(_ completion: @escaping (API) -> Void) {
        guard let url = URL(string: "https://mcuapi.herokuapp.com/api/v1/movies") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let movie = try JSONDecoder().decode(API.self, from: data)
                        print(movie)
                        completion(movie)
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("Status inválido do servidor, Status Code: \(response.statusCode)")
                }
            } else {
                print(error!.localizedDescription)
            }
        }.resume()
    }
}
