//
//  TodoManagerComponent.swift
//  Todo Protocols
//
//  Created by Benni on 14.08.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import Foundation
import Wind


protocol DependsOnTodoCollection { }
extension DependsOnTodoCollection where Self: AutomaticDependencyHandling {
	var todoCollection: TodoCollection {
		return component()
	}
}

class TodoCollectionComponent: AutomaticDependencyHandling, IndirectResolver, Instantiable, TodoCollection, DependsOnDataStore {

	/// AutomaticDependencyHandling
	var dependencies: [String : [Component]] = [:]
	required init() {}

	/// IndirectResolver
	typealias PublicInterface = TodoCollection
	typealias DependencyToken = DependsOnTodoCollection

	/// Component
	func dependenciesFullfilled() {
		todos = dataStore.getTodos()
	}

	/// TodoCollection
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
