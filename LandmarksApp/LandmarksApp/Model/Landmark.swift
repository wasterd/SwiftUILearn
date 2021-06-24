//
//  Landmark.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/17.
//

import Foundation
import SwiftUI
import CoreLocation

/**
 Hashable :只有遵循了Hashable 协议 才能被添加到 Set 中 或者用作 Dictionary 的 key 值
 Codable: 在swift4之前，swift中数据解析的方式大都采用OC的KVC机制，swift4后可以采用Codable直接将json转成对象
 */

struct Landmark: Hashable, Codable,Identifiable {
    var id:Int
    var name: String
    var park: String
    var state: String
    var description:String
    var isFavorite: Bool
    var isFeatured:Bool
    
    var category:Category
    
    enum Category:String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String//计算属性
    var image: Image {
        Image(imageName)
    }
    
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature"): nil
    }
    
    //你把这个属性标记为私有，因为你在下一步将只用它来创建一个公共计算属性。
    private var coordinates : Coordinates
    //计算一个对与 MapKit 框架交互有用的 locationCoordinate 属性。
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    
}
