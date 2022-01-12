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
            ToDo(name: "Get more bourbon", completed: false),
            ToDo(name: "Get more whiskey", completed: true)
        ]
    }
}
