//
//  Extensions.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/01.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
