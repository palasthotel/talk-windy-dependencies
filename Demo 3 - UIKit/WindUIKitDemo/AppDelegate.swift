//
//  AppDelegate.swift
//  WindUIKitDemo
//
//  Created by Enno Welbers on 10.09.18.
//  Copyright © 2018 Enno Welbers. All rights reserved.
//

import UIKit
import Wind

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    override init() {
        let container = Container()
        StorageImplementation.register(in: container)
        try! container.bootstrap()
        UIApplication.shared.Container = container
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }



}

