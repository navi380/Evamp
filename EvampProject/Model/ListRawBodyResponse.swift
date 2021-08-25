//
//  ListRawBodyResponse.swift
//  EvampProject
//
//  Created by Naveed Tahir on 25/08/2021.
//

import Foundation

struct ListRawBodyResponse: Codable {
    var status:String
    var items: [Items]?
}

struct Items:Codable {
    var id: String
    var itemImage: String
    var name: String
    var description: String
    var price: Double
}
