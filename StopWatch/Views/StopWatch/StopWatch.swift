//
//  StopWatch.swift
//  StopWatch
//
//  Created by 岡崎流依 on 2021/06/05.
//

import SwiftUI

struct StopWatch: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    
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
        }
    }
}

struct StopWatch_Previews: PreviewProvider {
    static var previews: some View {
        StopWatch()
    }
}
