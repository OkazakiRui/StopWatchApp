//
//  StopWatchLayout.swift
//  StopWatch
//
//  Created by 岡崎流依 on 2021/06/05.
//

import SwiftUI

struct StopWatchLayout: View {
    var body: some View {
        VStack {
            StopWatchTitle()
            StopWatch()
            
        }
    }
}

struct StopWatchLayout_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchLayout()
    }
}
