//
//  StopWatchManager.swift
//  StopWatch
//
//  Created by 岡崎流依 on 2021/06/05.
//

import Foundation
import SwiftUI
import UIKit

class StopWatchManager: ObservableObject {
    
    enum stopWatchMode {
        case running
        case stopped
        case poused
    }
    
    @Published var mode:stopWatchMode = .stopped
    
//    監視対象にする
    @AppStorage("secondsElapsedKey") var secondsElapsed = 0.00
    @AppStorage("minutesElapsedKey") var minutesElapsed = 0
    @AppStorage("hoursElapsedKey") var hoursElapsed = 0
    
    
    @Published var displayTime:String = "0:00:00.00"
    
//    値が変更されたらリロードする。
//    経過時間
    var timer = Timer()

    func Start() {
        print("実行中")
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {_ in
//            0.1秒ごとに実行
            self.secondsElapsed += 0.01
            
            if self.secondsElapsed >= 60 {
                self.secondsElapsed = 0.0
                self.minutesElapsed += 1
            }
            
            if self.minutesElapsed == 60 {
                self.minutesElapsed = 0
                self.hoursElapsed += 1
            }
            
            self.displayTime = String(self.hoursElapsed) + ":" + self.digitMinutes(num:Int(self.minutesElapsed)) + ":" + self.digitSeconds(num:Float(self.secondsElapsed))
        }
    }

    func Pouse() {
        print("一時停止")
        timer.invalidate()
        mode = .poused
    }
    
    func Stop() {
        print("実行停止")
        timer.invalidate()
        self.secondsElapsed = 0.00
        self.minutesElapsed = 0
        self.hoursElapsed = 0
        self.displayTime = "0:00:00.00"
        mode = .stopped
    }
    
    func digitSeconds(num:Float) -> String{
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
    
    func startText() -> String {
//        if displayTime == "0:00:00.00" {
//            var hour:String = "0"
//            var min:String = "00"
//            var sec:String = "00.00"
//
//            hour = String(hoursElapsed)
//
//            if minutesElapsed < 10 {
//                min = "0" + String(minutesElapsed)
//            } else {
//                min = String(minutesElapsed)
//            }
//
//            if secondsElapsed < 10.0 {
//                sec = "0" + String(format:"%.2f", minutesElapsed)
//            } else {
//                sec = String(format:"%.2f", minutesElapsed)
//            }
//
//            return hour + ":" + min + ":" + sec
//        } else {
//        print(displayTime)
        Start()
        Stop()
            return displayTime
//        }
    }
    
    
    var runBool:Bool = true
    @objc func didChange(notification: NSNotification) {
        print("change")
        if (notification.object as? UIDevice) != nil {
            if runBool {
                Pouse()
                Start()
            } else {
                Pouse()
            }
            runBool = !runBool
        }
    }
    
    
}
