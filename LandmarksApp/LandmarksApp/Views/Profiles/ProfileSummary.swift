//
//  ProfileSummary.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/22.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
  @EnvironmentObject   var modelData: ModelData
    var body: some View {
   
        VStack(alignment: .leading, spacing: 10.0) {
            Text(profile.userName)
                .bold()
                .font(.title)
            Text("Notification:\(profile.prefersNotifications ? "On":"Off")")
            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
            Text("Goal Date: \(profile.goalDate)")
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))

                    }
                    .padding(.bottom)
                    
                })
            }
            Divider()
            
            VStack(alignment: .leading) {
                Text("Recnt Hikes")
                    .font(.headline)
                HikeView(hike: modelData.hikes[0])
            }
            
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default).environmentObject(ModelData())
    }
}
