//
//  Color.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/4.
//

import UIKit

public func ToColor (hex: String) -> UIColor {
    
    let cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    // 顏色轉換
    var rgbValue: UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    return UIColor(
        red: CGFloat(rgbValue & 0xFF0000 >> 16) / 255.0,
        green: CGFloat(rgbValue & 0x00FF00 >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
    
}
