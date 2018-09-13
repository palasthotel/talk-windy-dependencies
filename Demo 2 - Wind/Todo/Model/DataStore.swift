//
//  DataStore.swift
//  Todo Simple
//
//  Created by Benni on 14.08.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import Foundation

protocol DataStore {
	func save(_ todos: [Todo])
	func getTodos() -> [Todo]
}



