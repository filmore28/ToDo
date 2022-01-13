//
//  ContentView.swift
//  ToDo
//
//  Created by Philip Moore on 2022-01-12.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var datastore: DataStore
    @State private var modalType: ModalType? = nil
    var body: some View {
        NavigationView {
            List() {
                ForEach(datastore.toDos) { toDo in
                    Button {
                        modalType = .update(toDo)
                    } label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundColor(toDo.completed ? .green : Color(.label))
                    }
                }
                .onDelete(perform: datastore.deleteToDo)
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My ToDos")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        modalType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
//        .sheet(item: $modalType) { modalType in
//            modalType
//        } same as bellow only shorter to write bellow
        .sheet(item: $modalType) { $0 }
        
        .alert("An Error has occurred.", isPresented: $datastore.didError, presenting: datastore.appError) { appError in
            Button("Continue") {  }
        } message: { appError in
            Text(appError.error.localizedDescription)
        }
//        the below alert is deprecated an will be removed in the future, the above is the replacement.
//        .alert(item: $datastore.appError) { appError in
//            Alert(title: Text("An Error has occurred"), message: Text(appError.error.localizedDescription))
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
