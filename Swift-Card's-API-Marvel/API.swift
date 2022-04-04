//
//  API.swift
//  Swift-Card's-API-Marvel
//
//  Created by Luccas Santana Marinho on 03/04/22.
//

import Foundation

struct API: Decodable {
    let data: [MovieData]
}

struct MovieData: Decodable {
    let id: Int
    let title: String
    let directed_by: String
}
