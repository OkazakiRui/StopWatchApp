//
//  StopWatchButton.swift
//  StopWatch
//
//  Created by 岡崎流依 on 2021/06/05.
//

import SwiftUI

struct StopWatchButton: View {
    let imageName:String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.pink)
            .padding()
    }
}

struct StopWatchButton_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchButton(imageName: "trash")
    }
}
