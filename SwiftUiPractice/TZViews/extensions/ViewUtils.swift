//
//  ViewUtils.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/4.
//

import UIKit
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
