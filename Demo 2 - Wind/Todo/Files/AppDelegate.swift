//
//  AppDelegate.swift
//  Todo
//
//  Created by Benni on 17.07.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import UIKit
import Wind

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	override init() {
		super.init()

		let container = Container()

		UserDefaultsDataStore.register(in: container)
		TodoCollectionComponent.register(in: container)

		do {
			try container.bootstrap()
		} catch {
			fatalError("container bootstrap failed")
		}

		UIApplication.shared.Container = container
	}
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		return true
	}
}

