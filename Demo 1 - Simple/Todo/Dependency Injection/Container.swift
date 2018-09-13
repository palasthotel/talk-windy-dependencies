//
//  Container.swift
//  Todo
//
//  Created by Benni on 25.07.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//


class Container {
	var factories: [String: Factory] = [:]

	func addFactory(_ factory: Factory, for service: String) -> Void {
		factories[service] = factory
	}

	func resolve(service: String) -> Component? {
		guard let factory = factories[service] else {
			return nil
		}

		let component = factory.create()
		component.resolveDependencies(using:self)
		return component
	}
}
