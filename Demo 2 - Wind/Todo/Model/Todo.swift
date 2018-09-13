//
//  Todo.swift
//  Todo
//
//  Created by Benni on 17.07.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import Foundation

struct Todo: Codable {
	let date: Date
	let text: String
	var isDone: Bool = false
}
