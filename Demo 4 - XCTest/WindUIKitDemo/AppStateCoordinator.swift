//
//  AppStateCoordinator.swift
//  WindUIKitDemo
//
//  Created by Enno Welbers on 10.09.18.
//  Copyright © 2018 Enno Welbers. All rights reserved.
//

import Foundation
import Wind

public protocol DependsOnAppState { }
public protocol AppState {
    var state:Bool { get }
    func EnsureOn() -> Void
    func EnsureOff() -> Void
}

public class AppStateCoordinator: AppState,Singleton,IndirectResolver,DependsOnStorage,AutomaticDependencyHandling {
    public var dependencies: [String : [Component]] = [:]
    public typealias DependencyToken = DependsOnAppState
    public typealias PublicInterface = AppState
    
    lazy var storage:Storage = component()
    
    public required init() {
        
    }
    
    public var state:Bool {
        return storage.state;
    }
    
    public func EnsureOn() {
        storage.state = true;
    }
    
    public func EnsureOff() {
        storage.state = false;
    }
}
