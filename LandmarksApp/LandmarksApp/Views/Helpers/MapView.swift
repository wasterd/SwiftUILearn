//
//  MapView.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/17.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate:CLLocationCoordinate2D
    
    //创建一个私有状态变量，用于保存地图的区域信息。
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
    var body: some View {
        Map(coordinateRegion: $region)
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        
        region = MKCoordinateRegion(
            center:coordinate,
            span:MKCoordinateSpan(latitudeDelta:0.2, longitudeDelta:0.2))
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate:CLLocationCoordinate2D(latitude:34.011_286, longitude:-116.166_868))
    }
}
