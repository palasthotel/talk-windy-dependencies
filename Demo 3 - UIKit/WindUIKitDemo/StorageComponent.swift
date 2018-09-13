//
//  StorageComponent.swift
//  WindUIKitDemo
//
//  Created by Enno Welbers on 10.09.18.
//  Copyright © 2018 Enno Welbers. All rights reserved.
//

import Foundation
import Wind

public protocol DependsOnStorage  { }

public protocol Storage {
    var state:Bool { get set }
}

public class StorageImplementation : Storage,Singleton,IndirectResolver,AutomaticDependencyHandling {
    public var dependencies: [String : [Component]] = [:]
    
    public typealias DependencyToken = DependsOnStorage
    public typealias PublicInterface = Storage
    
    public required init() {
        
    }
    
    public var state: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "AppState");
        }
        set {
            let defaults = UserDefaults.standard;
            defaults.set(newValue, forKey: "AppState");
            defaults.synchronize();
        }
    }

}
