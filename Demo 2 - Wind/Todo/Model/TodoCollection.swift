//
//  TodoDataStore.swift
//  Todo
//
//  Created by Benni on 25.07.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import Foundation


protocol TodoCollection: class {
	var todos: [Todo] { get set }
	func createTodo(with text: String)
	func delete(_ todo: Todo)
}
