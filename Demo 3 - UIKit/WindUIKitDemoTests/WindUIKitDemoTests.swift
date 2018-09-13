//
//  WindUIKitDemoTests.swift
//  WindUIKitDemoTests
//
//  Created by Enno Welbers on 10.09.18.
//  Copyright © 2018 Enno Welbers. All rights reserved.
//

import XCTest
import Wind
@testable import WindUIKitDemo

class WindUIKitDemoTests: XCTestCase {
    
    class StorageMock: Storage,Singleton,IndirectResolver,AutomaticDependencyHandling {
        var dependencies: [String : [Component]] = [:]
        typealias DependencyToken = DependsOnStorage
        typealias PublicInterface = Storage
        
        required init() {
            state = true;
        }
        
        var state: Bool
    }
    
    var testComponent:AppState!
    var storage:Storage!
    
    override func setUp() {
        super.setUp()
        let container = Container();
        AppStateCoordinator.register(in: container);
        StorageMock.register(in: container);
        try! container.bootstrap()
        testComponent = container.resolve()
        storage = container.resolve()
    }
        
    func testAppState() {
        testComponent.EnsureOn()
        XCTAssertTrue(testComponent.state)
        XCTAssertTrue(storage.state)
    }
    
}
