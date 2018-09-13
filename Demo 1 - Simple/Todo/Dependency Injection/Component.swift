//
//  Component.swift
//  Todo
//
//  Created by Benni on 11.09.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import Foundation

protocol Component {
	func resolveDependencies(using container: Container)
}

