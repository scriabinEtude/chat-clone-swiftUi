//
//  LogUtil.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/02.
//

import Foundation

struct LogUtil {
    static private var prefix = "DEBUG: "
    
    static func error(_ message: String, error: Error) {
        print(prefix + " " + message + " " + error.localizedDescription)
    }
}
