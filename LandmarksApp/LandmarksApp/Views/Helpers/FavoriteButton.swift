//
//  FavoriteButton.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/17.
//

import SwiftUI

struct FavoriteButton: View {
    /*
     @Binding的作用是什么：绑定控制值的存储，因此您可以将数据传递到需要读取或写入它的不同数据（A binding controls the storage for a value, so you can pass data around to different views that need to read or write it. ）
     */
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        } ){
            Image(systemName: isSet ? "star.fill":"star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
