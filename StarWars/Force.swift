//
//  Force.swift
//  StarWars
//
//  Created by Field Employee on 12/18/20.
//

import Foundation

//struct Results: Decodable {
//    let name: String
//
//    enum ResultsCodingKey: String, CodingKey {
//        case name
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try
//            decoder.container(keyedBy: CodingKey.self)
//
//        let resultsContainer = try
//            container.nestedContainer(keyedBy: ResultsCodingKey.self, forKey: .name)
//
//        self.name = try
//            resultsContainer.decode(String.self, forKey: .name)
//    }
//}

struct ForceUser {
    let name: String
    let hairColor: String
    let eyeColor: String
    let homeWorld: String
    
    init?(json:[String: Any]) {
        guard let name = json["name"] as? String,
              let hairColor = json["hair_color"] as? String,
              let eyeColor = json["eye_color"] as? String,
              let homeWorld = json["homeworld"] as? String else {return nil}
    
    self.name = name
        self.hairColor = hairColor
        self.eyeColor = eyeColor
        self.homeWorld = homeWorld
    }
}

struct Force: Decodable {
    let name: String
    let eyeColor: String
    let hairColor: String
    let homeWorld: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case hair_color
        case eye_color
        case homeworld
    }
    
    init(from decoder: Decoder) throws {
        let container = try
            decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.eyeColor = try container.decode(String.self, forKey: .eye_color)
        self.hairColor = try container.decode(String.self, forKey: .hair_color)
        self.homeWorld = try container.decode(String.self, forKey: .homeworld)
    }
}
