//
//  DataStoreComponent.swift
//  Todo
//
//  Created by Benni on 25.07.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import Foundation


/// UserDefaultsDataStore
class DataStoreComponent: DataStore {
	func save(_ todos: [Todo]) {
		let dicts = todos.map { todo in
			return [
				"text": todo.text,
				"date": todo.date,
				"isDone": todo.isDone
			]
		}

		save(value: dicts, for: "todos")
	}

	func getTodos() -> [Todo] {
		let savedTodos: [[String: Any]] = getValue(for: "todos") ?? []

		return savedTodos.map { todoDict in
			return Todo(
				date: todoDict["date"] as? Date ?? Date(),
				text: todoDict["text"] as? String ?? "",
				isDone: todoDict["isDone"] as? Bool ?? false
			)
		}
	}
}


// MARK: - Private methods and properties
private extension DataStoreComponent {
	func save(value: Any, for key: String) {
		UserDefaults.standard.set(value, forKey: key)
	}

	func getValue<T>(for key: String) -> T? {
		return UserDefaults.standard.value(forKey: key) as? T
	}
}


// MARK: - Factory
class DataStoreFactory: Factory {
	func create() -> Component {
		return DataStoreComponent()
	}
}


// MARK: - Component
extension DataStoreComponent: Component {
	func resolveDependencies(using container: Container) {
		
	}
}
