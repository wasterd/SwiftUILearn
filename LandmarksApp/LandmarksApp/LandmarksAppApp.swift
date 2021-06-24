//
//  LandmarksAppApp.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/17.
//

import SwiftUI

@main
struct LandmarksAppApp: App {
    //StateObject属性 只为给定属性初始化一次模型对象
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
