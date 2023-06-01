//
//  LandmarkDetail.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/4.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top) // 移除上方系統預留的邊界
                    .frame(height: 300)
                
                CircleImage(image: landmark.image)
                    .offset(y: -130) // 自身向上偏移 130
                    .padding(.bottom, -130) // 下方 padding 也要跟著減少
                
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                    .foregroundColor(.black)
                    
                    HStack {
                        Text(landmark.park)
                        Spacer() // iOS 的 Spacer 預設填滿剩下的所有空間
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
