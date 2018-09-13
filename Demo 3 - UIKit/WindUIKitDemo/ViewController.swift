//
//  ViewController.swift
//  WindUIKitDemo
//
//  Created by Enno Welbers on 10.09.18.
//  Copyright © 2018 Enno Welbers. All rights reserved.
//

import UIKit
import Wind

class ViewController: UIViewController,DependsOnStorage,AutomaticDependencyHandling {
    var dependencies: [String : [Component]] = [:]
    

    lazy var storage:Storage = component()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onOffButton.isOn=storage.state;
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var onOffButton: UISwitch!
    
    @IBAction func buttonStateChanged(_ sender: Any) {
        storage.state = onOffButton.isOn;
    }
}

