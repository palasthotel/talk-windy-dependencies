//
//  TodoCollectionComponent.swift
//  Todo
//
//  Created by Benni on 14.08.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import Foundation



// MARK: - TodoCollectionComponent
class TodoCollectionComponent: TodoCollection {
	var dataStore: DataStore!

	var todos: [Todo] = []
	
	func createTodo(with text: String) {
		let newTodo = Todo(date: Date(), text: text, isDone: false)
		todos.append(newTodo)
		dataStore.save(todos)
	}

	func delete(_ todo: Todo) {
		todos = todos.filter {
			return todo.text != $0.text
		}
		dataStore.save(todos)
	}
}


// MARK: - Factory
class TodoCollectionFactory: Factory {
	func create() -> Component {
		return TodoCollectionComponent()
	}
}


// MARK: - Component
extension TodoCollectionComponent: Component {
	func resolveDependencies(using container: Container) {
		dataStore = container.resolve(service: "DataStoreFactory") as? DataStoreComponent
		todos = dataStore.getTodos()
	}
}
