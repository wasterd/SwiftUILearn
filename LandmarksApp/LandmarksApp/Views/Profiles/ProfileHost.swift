//
//  ProfileHost.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/22.
//

import SwiftUI

//将承载配置文件信息的静态摘要视图和编辑模式
struct ProfileHost: View {
    
    //SwiftUI 在环境中为您可以使用 @Environment 属性包装器访问的值提供存储。访问 editMode 值以读取或写入编辑范围。
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 20.0) {
            HStack {
                
                if editMode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }else{
                ProfileEditor(profile: $draftProfile)
                .onAppear {
                    draftProfile = modelData.profile
                }
                .onDisappear {
                    modelData.profile = draftProfile;
                }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ModelData())
    }
}
