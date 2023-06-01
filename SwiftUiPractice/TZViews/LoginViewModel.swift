//
//  LoginViewModel.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/4.
//

import Combine
import SwiftUI

final class LoginViewModel: ObservableObject {
    
    
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var state: State = .loaded
    @Published var RegisterActive = false
    @Published var forgetPasswordActive = false
    @Published var isVipAlert = false
    @Published var newEmail: String = ""
    @Published var isNewEmailAlert = false
    
    @Published var errorMessage = "" {
        didSet {
            
        }
    }
    
    @Published var isErrorShown = false {
        didSet {
            state = .error
        }
    }
    
    func bindStart() {
        
//        if !validatorEmail(email) {
//            errorMessage = "请输入电子信箱"
//            isErrorShown = true
//        }else if !validatorPassword(password) {
//            errorMessage = "密码需大于6位数"
//            isErrorShown = true
//        }else{
//            state = .loading
//            cancellables = []
//            bindInputs()
//            bindOutputs()
//            onAppearSubject.send(())
//        }
        
    }

    
}

extension LoginViewModel {
    enum State {
        case loading
        case loaded
        case error
    }
}


