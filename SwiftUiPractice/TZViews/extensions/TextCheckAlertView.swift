//
//  TextCheckAlertView.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/4.
//

import SwiftUI

struct TextCheckAlertView: UIViewControllerRepresentable {
    
    @Binding var title: String
    
    @Binding var message: String

    @Binding var isShowingAlert: Bool
        
    var leftButtonAction: (() -> Void)?
    
    var rightButtonAction: (() -> Void)?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<TextCheckAlertView>) -> some UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<TextCheckAlertView>) {
        
        if !isShowingAlert {
            return
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //cancelAction.setValue(ToColor(hex: "5A5A5A"), forKey: "_titleTextColor")
        
        alert.addAction(UIAlertAction(title: "确认", style: .default) { _ in
            alert.dismiss(animated: true) {
                isShowingAlert = false
                rightButtonAction?()
            }
        })
        alert.addAction(UIAlertAction(title: "取消", style: .cancel) { _ in
            alert.dismiss(animated: true) {
                isShowingAlert = false
                leftButtonAction?()
            }
        })
        
        
        DispatchQueue.main.async {
            uiViewController.present(alert, animated: true, completion: {
                isShowingAlert = false
            })
        }
    }
    
}

struct TextCheckAlertView_Previews: PreviewProvider {
    static var previews: some View {
        TextCheckAlertView(
            title: .constant("提醒"),
            message: .constant("你已成功购买抖抖的VIP会员，请先完成注册后登入，获取你购买的金币/时段"),
            isShowingAlert: .constant(true)
        )
    }
}
