//
//  StopWatchTitle.swift
//  StopWatch
//
//  Created by 岡崎流依 on 2021/06/05.
//

import SwiftUI

struct StopWatchTitle: View {
    var body: some View {
        Text("ストップウォッチ")
            .font(.custom( "Avenir", size: 40))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    }
}

struct StopWatchTitle_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchTitle()
    }
}
