//
//  ViewController.swift
//  AudioSystemSwift
//
//  Created by Monika Schepan on 03.12.17.
//  Copyright © 2017 Monika Schepan. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        var consoleMsg = ""
        switch (central.state) {
        case .poweredOff:
            consoleMsg = "BLe is powered off"
            
        case .poweredOn:
            consoleMsg = "BLe is powered on"
            manager.scanForPeripherals(withServices: nil, options: nil)
            
        case .unsupported:
            consoleMsg = "BLe unsupported"
            manager.scanForPeripherals(withServices: nil, options: nil)
            
        case .unauthorized:
            consoleMsg = "BLe unauthorized"
            
        case .unknown:
            consoleMsg = "BLe unknown"
        default:
            consoleMsg = " default"
        }
        
        print("\(consoleMsg)")
        
    }
    

    var manager:CBCentralManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        manager   = CBCentralManager(delegate: self, queue:nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Peripheral: \(peripheral)")
    }
    
   
    


}



