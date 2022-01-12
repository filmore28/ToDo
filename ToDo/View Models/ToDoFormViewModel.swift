//
//  ToDoFormViewModel.swift
//  ToDo
//
//  Created by Philip Moore on 2022-01-12.
//

import Foundation

class ToDoFormViewModel: ObservableObject {
    @Published var name = ""
    @Published var completed = false
    var id: String?
    
    var updating: Bool {
        id != nil
    }
    var isDisabled: Bool {
        name.isEmpty
    }
    
    init() {}
    
    init(_ currentToD: ToDo) {
        self.name = currentToD.name
        self.completed = currentToD.completed
        id = currentToD.id
    }
}
