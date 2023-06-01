//
//  TextFieldEamilAlertView.swift
//  SwiftUiPractice
//
//  Created by 唐振中 on 2023/5/4.
//

import SwiftUI

struct TextFieldEamilAlertView: UIViewControllerRepresentable {
    
    @Binding var text: String
    
    @Binding var isShowingAlert: Bool
    
    let placeholder: String
    
    var leftButtonAction: (() -> Void)?
    
    var rightButtonAction: (() -> Void)?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<TextFieldEamilAlertView>) -> some UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<TextFieldEamilAlertView>) {
        
        guard context.coordinator.alert == nil else {
            return
        }
        
        if !isShowingAlert {
            return
        }
        
        let alert = UIAlertController(title: "", message: "您是抖抖1.0的用户，您原来的Email在抖抖2.0中已经存在，请输入一个新的Email", preferredStyle: .alert)
        context.coordinator.alert = alert
        
        alert.addTextField { textField in
            textField.placeholder = placeholder
            textField.text = text
            textField.delegate = context.coordinator
            textField.keyboardType = .emailAddress
        }
    
        alert.addAction(UIAlertAction(title: "确认", style: .default) { _ in
            if let textField = alert.textFields?.first, let text = textField.text {
                self.text = text
            }
            alert.dismiss(animated: true) {
                isShowingAlert = false
                rightButtonAction?()
            }
        })
        
        //cancelAction.setValue(ToColor(hex: "5A5A5A"), forKey: "_titleTextColor")
        alert.addAction(UIAlertAction(title: "取消", style: .cancel) { _ in
            alert.dismiss(animated: true) {
                isShowingAlert = false
                leftButtonAction?()
            }
        })
    
        
        DispatchQueue.main.async {
            uiViewController.present(alert, animated: true, completion: {
                isShowingAlert = false
                context.coordinator.alert = nil
            })
        }
    }
    
    func makeCoordinator() -> TextFieldEamilAlertView.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        var alert: UIAlertController?
        var view: TextFieldEamilAlertView
        
        init(_ view: TextFieldEamilAlertView) {
            self.view = view
        }
        
//        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//            guard let text = textField.text else { return true }
//            let count = text.count + string.count - range.length
//            return count <= 4
//        }
    }
    
}

struct TextFieldEamilAlertView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldEamilAlertView(
            text: .constant("aabbcc"),
            isShowingAlert: .constant(true),
            placeholder: "123456"
        )
    }
}
