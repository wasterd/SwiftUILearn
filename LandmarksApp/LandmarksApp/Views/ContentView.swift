//
//  ContentView.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/17.
//

import SwiftUI
//内容相关- 根视图
struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    //添加要显示的选项卡的枚举
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        
        TabView(selection: $selection,
                content:  {
                    CategoryHome()
                        .tabItem {
                            Label("Featured", systemImage: "star")
                        }
                        .tag(Tab.featured)
                    LandmarkList()
                        .tabItem {
                            Label("List", systemImage: "list.bullet")
                        }
                        .tag(Tab.list)
                })
        
        LandmarkList()
    }
}
//视图预览相关
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
