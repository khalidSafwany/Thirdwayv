//
//  Connectivity.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 2/2/22.
//

import Foundation
import Network

class Connectivity {
    
    let monitor = NWPathMonitor()
    
    let queue = DispatchQueue(label: "Monitor")
    
    var isConnected: Bool?{
        didSet{
            let sentData :[String: Bool] = [Strings.networkNOtificationCenterDataName: isConnected!]
            NotificationCenter.default.post(name: NSNotification.Name(Strings.networkNotificationCenterName), object: nil, userInfo: sentData)
        }
    }
    
    
    func start(){
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("there is internet")
                self.isConnected = true
            } else{
                print("no Internet")
                self.isConnected = false
            }
        }
        
        self.monitor.start(queue: self.queue)
    }
    
    
}
