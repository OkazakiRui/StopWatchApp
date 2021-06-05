//
//  StopWatch.swift
//  StopWatch
//
//  Created by 岡崎流依 on 2021/06/05.
//

import SwiftUI

struct StopWatch: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    @State var useBool = false
    
    func activateProximitySensor() {
        print("activate")
        UIDevice.current.isProximityMonitoringEnabled = true
        
        if UIDevice.current.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(stopWatchManager, selector: #selector(stopWatchManager.didChange), name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
        }
    }
    
    
    func useProximity() {
        activateProximitySensor()
        self.useBool = true
    }
    
//    func deactivateProximitySensor() {
////        Viewが表示されていない時にする
//        print("deactivate")
//        UIDevice.current.isProximityMonitoringEnabled = false
//
//        NotificationCenter.default.removeObserver(stopWatchManager, name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
//    }
    
    var body: some View {
        VStack {
            Text(stopWatchManager.displayTime)
                .font(.custom( "Avenir", size: 50))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
            
            HStack {
                Button(action: { stopWatchManager.mode == .running ?  stopWatchManager.Pouse() : stopWatchManager.Start() }, label: {
                    StopWatchButton(imageName: stopWatchManager.mode == .running ? "stop.fill" : "play.fill" )
                })
                
                Button(action: { stopWatchManager.Stop() }, label: {
                    StopWatchButton(imageName: "clear")
                })
            }
            .foregroundColor(.black)
            .padding(.bottom)
            
            if useBool == false {
                Button(action: { useProximity() }, label: {
                    Text("接近センサーを使う")
                })
            }
            
            
        }
    }
}


struct StopWatch_Previews: PreviewProvider {
    static var previews: some View {
        StopWatch()
    }
}
