//
//  ToDo.swift
//  ToDo
//
//  Created by Philip Moore on 2022-01-12.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String = UUID().uuidString
var name: String
    var completed: Bool = false
    
    static var sampleData: [ToDo] {
        [
            ToDo(name: "Get lube", completed: false),
            ToDo(name: "Get toys", completed: true)
        ]
    }
}
