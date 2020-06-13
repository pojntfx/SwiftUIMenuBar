//
//  ContentView.swift
//  SwiftUIMenuBar
//
//  Created by Felicitas Pojtinger on 13.06.20.
//  Copyright © 2020 Felicitas Pojtinger. All rights reserved.
//

import SwiftUI

struct TodoModel: Identifiable, Codable {
    var id = UUID()
    var title: String
}

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoModel] = []
    
    func createTodo(todo: TodoModel) {
        todos.append(todo)
    }
}

struct ContentView: View {
    @ObservedObject var todoVM = TodoViewModel()
    @State var newTodo = ""
    
    var body: some View {
        Form {
            List(todoVM.todos) { todo in
                Text(todo.title)
            }
            HStack {
                TextField("New todo", text: $newTodo, onCommit: createTodo)
                Button(action: createTodo) {
                    HStack {
                        Image(nsImage: NSImage(named: NSImage.addTemplateName)!)
                        Text("Create")
                    }
                }
            }
            
            .padding()
        }
    }
    
    func createTodo() {
        if !self.newTodo.isEmpty {
           self.todoVM.createTodo(todo: TodoModel(title: self.newTodo))
           
           self.newTodo = ""
       }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
