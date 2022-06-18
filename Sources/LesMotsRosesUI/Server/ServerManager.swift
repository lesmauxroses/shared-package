//
//  ServerManager.swift
//  
//
//  Created by Killian Sowa on 10/05/2022.
//

import SwiftUI
import SocketIO

public class ServerManager: ObservableObject {
    public static let instance = ServerManager()
//    var responseLabel = "Modèle 2"
    
    //    var url = "ws://172.17.129.124:3000" // wifi visiteur
//        var url = "ws://172.20.10.3:3000" // wifi de kilian sur Mac Amélie
    //    var url = "ws://172.20.10.13:3000" // wifi de kilian sur Mac Killian
    //    var url = "ws://192.168.8.118:3000" // wifi box 4G
                
    let manager = SocketManager(socketURL: URL(string: "ws://192.168.8.118:3000")!, config: [.log(true), .compress])
    var currentInteraction: String?
    var currentDevice: String?
    
    public func emitEvent(eventName: String, data: [String:Any]) {
        let socket = manager.defaultSocket
        
        socket.emit(eventName, data)
    }
    
    public func connect(interaction: String, device: String) {
        print("[ServerManager:connect] Trying to connect")
        let socket = manager.defaultSocket
        
        currentInteraction = interaction
        currentDevice = device
        
        socket.on(clientEvent: .connect) { data, ack in
            print("[ServerManager:connect] Socket connected")
            
            socket.on("register") { data, ack in
                print("[ServerManager]: connect -> Data registered")
                print(data)
            }
            
            self.emitEvent(eventName: "register", data: ["interactionNumber": interaction, "deviceType": device])
            
            socket.on("changeStep") { data, ack  in
                guard let dataDictionary = data[0] as? NSDictionary else { return }
                guard let newStep = dataDictionary["newStep"] as? String else { return }
                
                print("[ServerManager]: newStep -> \(newStep)")
                
                NotificationCenter.default.post(name: Notification.Name("stepChanged"), object: nil, userInfo: ["newStep": newStep])
            }
        }
        
        socket.connect()
    }
}
