//
//  Badge.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/18.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8

    var badgeSymbols: some View {
        //一个完整的 360° 旋转分为八个部分，通过重复山符号来创建类似太阳的图案。
        ForEach(0..<Badge.rotationCount){ i  in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double (Badge.rotationCount)) * 360.0
                )
        }
        .opacity(0.5)
    }
    
    
    
    var body: some View {
        ZStack {
            BadgeBackground()
            /*
             GeometryReader的主要作用就是能够获取到父view建议的尺寸。


             */
            GeometryReader {geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0/4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
