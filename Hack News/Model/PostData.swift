//
//  PostData.swift
//  Hack News
//
//  Created by Olexsii Levchenko on 13.10.2021.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
    
}

struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
    
   
