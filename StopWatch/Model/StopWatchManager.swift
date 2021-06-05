//
//  StopWatchManager.swift
//  StopWatch
//
//  Created by 岡崎流依 on 2021/06/05.
//

import Foundation
import SwiftUI

class StopWatchManager: ObservableObject {
    
    enum stopWatchMode {
        case running
        case stopped
        case poused
    }
    
    @Published var mode:stopWatchMode = .stopped
    
//    監視対象にする
    var secondsElapsed:Float = 0.00
    var minutesElapsed:Int = 0
    var hoursElapsed:Int = 0
    
    @Published var displayTime:String = "0:00:00.00"
    
//    値が変更されたらリロードする。
//    経過時間
    var timer = Timer()

    func Start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {_ in
//            0.1秒ごとに実行
            self.secondsElapsed += 0.01
            
            if self.secondsElapsed >= 60 {
                self.secondsElapsed = 0.0
                self.minutesElapsed += 1
            }
            
            if self.hoursElapsed == 60 {
                self.minutesElapsed = 0
                self.hoursElapsed += 1
            }
            
            self.displayTime = String(self.hoursElapsed) + ":" + self.digitMinutes(num:self.minutesElapsed) + ":" + self.digitMinutes(num:self.secondsElapsed)
        }
    }

    func Pouse() {
        timer.invalidate()
        mode = .poused
    }
    
    func Stop() {
        timer.invalidate()
        self.secondsElapsed = 0.00
        self.minutesElapsed = 0
        self.hoursElapsed = 0
        self.displayTime = "0:00:00.00"
        mode = .stopped
    }
    
    func digitMinutes(num:Float) -> String{
        if num < 10.0 {
            return "0" + String(format:"%.2f", num)
        } else {
            return String(format:"%.2f", num)
        }
    }
    
    func digitMinutes(num:Int) -> String {
        if num < 10 {
            return "0" + String(num)
        } else {
            return String(num)
        }
    }
}
