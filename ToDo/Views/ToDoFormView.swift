//
//  ToDoFormView.swift
//  ToDo
//
//  Created by Philip Moore on 2022-01-12.
//

import SwiftUI

struct ToDoFormView: View {
    @EnvironmentObject var datastore: DataStore
    @ObservedObject var formVM: ToDoFormViewModel
    @Environment(\.presentationMode) var presentaionMode
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    TextField("ToDo", text: $formVM.name)
                    Toggle("Completed", isOn: $formVM.completed)
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton, trailing: updateSaveButton)
        }
    }
}

extension ToDoFormView {
    func updateToDo() {
        let toDo = ToDo(id: formVM.id!, name: formVM.name, completed: formVM.completed)
        datastore.updateToDo(toDo)
        presentaionMode.wrappedValue.dismiss()
    }
    
    func addToDo() {
        let toDo = ToDo(name: formVM.name)
        datastore.addToDo(toDo)
        presentaionMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            presentaionMode.wrappedValue.dismiss()
        }
    }
    var updateSaveButton: some View {
        Button( formVM.updating ? "Update" : "Save", action: formVM.updating ? updateToDo : addToDo)
            .disabled(formVM.isDisabled)
    }
}



struct ToDoFormView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoFormView(formVM: ToDoFormViewModel())
            .environmentObject(DataStore())
    }
}
