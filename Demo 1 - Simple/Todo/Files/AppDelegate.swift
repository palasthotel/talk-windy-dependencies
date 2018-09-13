//
//  AppDelegate.swift
//  Todo
//
//  Created by Benni on 17.07.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	var container = Container()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		container.addFactory(DataStoreFactory(), for: "DataStoreFactory")
		container.addFactory(TodoCollectionFactory(), for: "TodoCollectionFactory")

		return true
	}
}

