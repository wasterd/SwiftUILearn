//
//  LandmarkList.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/17.
//

import SwiftUI

struct LandmarkList: View {
    /**
     @EnvironmentObject、ObservableObject、@Published理解
     对于这三个特性，我们可以简单记录一下，EnvironmentObject修饰属性是当前的环境变量，并在它自己以及它的子视图都可以直接使用，也可以叫做当前当前视图全局变量
     
     @State和@ObservableObject之间有一些细微的差异。这些都是很重要的，因为它们都有不同的用途。
     首先，@State在视图本地。值或数据在视图中本地保存。它由框架管理，由于它存储在本地，因此它是一个值类型。
     但是@ObservableObject在视图外部，并且不存储在视图中。它是一种引用类型，因为它不在本地存储，而只是具有对该值的引用。这不是由框架自动管理的，而是开发人员的责任。这最适用于外部数据，例如数据库或由代码管理的模型。

     @Binding也在视图内，但是与@State区别在于@Binding用于不通视图之间的参数传递。@Binding 和@ObservedObbjecg一样都是传递引用。

     @EnvironmentObject 可以理解为全局变量
     具体细微差别，大家可以访问demo页面体验用途的不同。
     ————————————————
     版权声明：本文为CSDN博主「海阔任月飞」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
     原文链接：https://blog.csdn.net/yaojinhai06/article/details/107068924
     */
    @EnvironmentObject var modelData: ModelData
    
    /*
     @State: Use the @State property wrapper to mark a value as state, declare the property as private, and give it a default value.
     */
    @State private var showFavoritesOnly = true
    
    
    var filteredLandmarks:[Landmark]{
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
        NavigationView {
            
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //        ForEach(["iPhone SE (2nd generation)","iPhone XS Max"], id: \.self) { deviceName in
        //            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName)
        //            )
       // environmentObject 您应用此修改器，以便视图层次结构中更下方的视图可以读取通过环境向下传递的数据对象。
        LandmarkList()
            .environmentObject(ModelData())
        
    }
}
