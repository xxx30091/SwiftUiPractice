//
//  LandMark.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/3.
//

import Foundation
import SwiftUI
import CoreLocation

// Codable 用以讓在 structure 跟 資料檔案之間轉移資料
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    // 要先 import SwiftUI 才能用 Image
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    // 用以計算跟 MapKit 作用的屬性
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

