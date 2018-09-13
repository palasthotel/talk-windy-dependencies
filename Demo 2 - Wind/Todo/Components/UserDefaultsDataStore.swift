//
//  UserDefaultsDataStore.swift
//  Todo Protocols
//
//  Created by Benni on 14.08.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import Foundation
import Wind

protocol DependsOnDataStore {}
extension DependsOnDataStore where Self: AutomaticDependencyHandling {
	var dataStore: DataStore {
		return component()
	}
}

final class UserDefaultsDataStore: AutomaticDependencyHandling, IndirectResolver, Instantiable {
	var dependencies: [String : [Component]] = [:]
	typealias PublicInterface = DataStore
	typealias DependencyToken = DependsOnDataStore
}

extension UserDefaultsDataStore: DataStore {
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
private extension UserDefaultsDataStore {
	func save(value: Any, for key: String) {
		UserDefaults.standard.set(value, forKey: key)
	}

	func getValue<T>(for key: String) -> T? {
		return UserDefaults.standard.value(forKey: key) as? T
	}
}

