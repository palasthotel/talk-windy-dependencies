//
//  DataStoreComponent.swift
//  Todo Protocols
//
//  Created by Benni on 14.08.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import Foundation
import UIKit
import Wind


fileprivate typealias WindProtocols = (
	AutomaticDependencyHandling &
	IndirectResolver &
	Instantiable
)

final class JSONDataStoreComponent: WindProtocols {
	var dependencies: [String : [Component]] = [:]
	typealias PublicInterface = DataStore
	typealias DependencyToken = DependsOnDataStore
}

extension JSONDataStoreComponent: DataStore {
	func save(_ todos: [Todo]) {
		do {
			let url = documentsDirectory.appendingPathComponent("data.json")

			let encoded = try JSONEncoder().encode(todos)
			try encoded.write(to: url)
		} catch {
			print("\(error.localizedDescription)")
		}
	}

	func getTodos() -> [Todo] {
		let url = documentsDirectory.appendingPathComponent("data.json")

		do {
			let data = try Data(contentsOf: url)
			return try JSONDecoder().decode([Todo].self, from: data)
		} catch {
			print("\(error.localizedDescription)")
			return []
		}
	}
}


private extension JSONDataStoreComponent {
	var documentsDirectory: URL {
		return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	}
}
