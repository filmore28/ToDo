//
//  DataStore.swift
//  ToDo
//
//  Created by Philip Moore on 2022-01-12.
//

import Foundation
import SwiftUI

class DataStore: ObservableObject {
    @Published var toDos: [ToDo] = []
    @Published var appError: ErrorType? = nil
    @Published var didError = false
    init() {
        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: fileName) {
            loadToDos()
        }
    }
    
    func addToDo(_ toDo: ToDo) {
        toDos.append(toDo)
        saveTodos()
    }
    
    func updateToDo(_ toDo: ToDo) {
        guard let index = toDos.firstIndex(where: { $0.id == toDo.id }) else { return }
        toDos[index] = toDo
        saveTodos()
    }
    
    func deleteToDo(at indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveTodos()
    }
    
    func loadToDos() {
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    toDos = try decoder.decode([ToDo].self, from: data)
                } catch {
                    print(ToDoError.decodingError.localizedDescription)
                    appError = ErrorType(error: .decodingError)
                    didError = true
                }
            case .failure(let error):
                //print(error.localizedDescription)
                appError = ErrorType(error: error)
                didError = true
            }
        }
    }
    
    func saveTodos() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(toDos)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { (error) in
                if let error = error {
                    //print(error.localizedDescription)
                    appError = ErrorType(error: error)
                    didError = true
                }
            }
        } catch {
            //print(ToDoError.encodingError.localizedDescription)
            appError = ErrorType(error: .encodingError)
            didError = true
        }
    }
}
