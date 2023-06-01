//
//  CircleImage.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/3.
//

import SwiftUI

struct CircleImage: View {
    // custom view 通常會自定義修飾符，因為在 data class 中已經將 image 處理好成 Image 所以可以直接傳進來
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
//        Image("turtlerock")
//            .clipShape(Circle())
//            .overlay {
//                Circle().stroke(.white, lineWidth: 4)
//                    .shadow(radius: 7)
//            }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
