//
//  LandmarkList.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/4.
//

import SwiftUI

struct LandmarkList: View {
    // @State 用於儲存只用於該 View 及其子項的特定資訊，故必定為 private
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        // 列表能作用於可識別的資料。兩種方式識別資料：1. 將資料傳遞給唯一標識每個元素的屬性的關鍵路徑 2.資料型別符合可識別協議。
        // 類似 compose LazyColumn 的 key
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
        // 若該組間需要跳轉到別頁，則可在外面包上一層 NavigationView 來表示這個 View 是可以跳轉的
        NavigationView {
            // 原先在 data class 加上 Identifiable 時，資料須用 id 來分辨獨特性，但因每個 id 都具有獨特性，
            // 所以可以在 data class 加上 Identifiable 來簡化，如此便不用再特地指定 id
            List(filteredLandmarks) { landmark in
                NavigationLink { // 加上 NavigationLink 並在其中加入要跳轉的目標 （ iOS 太神奇了吧......
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
            // 為這個 navigation view 加上上方 title
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // 在 preview 用不同型號的手機來預覽，名稱必須是 scheme menu 中有的
//        ForEach(["iPhone SE (3rd generation)", "iPhone 14 Pro Max"], id: \.self) { deviceName in
            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName) // 讓預覽根據指定的資訊提供標籤
//        }
    }
}
