//
//  CategoryHome.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/21.
//

import SwiftUI

struct CategoryHome: View {
    //创建一个环境变量
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        
        NavigationView {
            List {
                modelData.features[0].image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .listRowInsets(EdgeInsets())
                    .listRowInsets(EdgeInsets())

                
                ForEach(modelData.categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
            .listStyle(InsetListStyle())
            .toolbar{
                Button(action: { showingProfile.toggle() }, label: {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                    
                })
            }
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost()
                    .environmentObject(modelData)
            })
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
