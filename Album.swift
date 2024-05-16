//
//  ViewModel.swift
//  ListApp
//
//  Created by Sushmitha Rani on 16/05/24.
//

import Foundation

struct Album: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let title: String
    let url: URL
    let thumbnailUrl: URL
    
    var thumbnailURL: URL {
        return thumbnailUrl
    }
}
/*"albumId": 1,
 "id": 1,
 "title": "accusamus beatae ad facilis cum similique qui sunt",
 "url": "https://via.placeholder.com/600/92c952",
 "thumbnailUrl": "https://via.placeholder.com/150/92c952"*/
