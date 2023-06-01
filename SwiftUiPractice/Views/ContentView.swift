//
//  ContentView.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, iOS!")
        }
        .padding()
    }
}

struct Sample1: View {
    var body: some View {
        VStack {
            Text("Test")
                .font(Font.system(size: 50, weight: .heavy))
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .foregroundColor(.blue)
            
            Image("android")
                .resizable(resizingMode: .stretch) // stretch: 延伸縮放(預設)、tile: 生成多個填滿空間
            // scaledToFit 讓圖片維持比例，若還要指定寬高要寫在 resizable 前
            // .aspectRatio(contentMode: .fit) // 可以取代 scaledToFit 達成同樣效果
                .scaledToFit()
            // scaledToFill 維持比例並佔滿空間；寫在 frame 前可維持比例並佔滿指定寬高
//                .scaledToFill()
            // 若 scaledToFill 後有超出 指定寬高的部分，用 .clipped() 可以切除
//                .clipped()
                .frame(width: 300, height: 300) // 先呼叫 resizable 再設定 frame 可調整圖片大小
                .imageScale(.large)
                .foregroundColor(.accentColor)
                
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContentView()
            Sample1()
        }
    }
}
    
