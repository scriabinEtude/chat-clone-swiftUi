//
//  Message.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/01.
//

import Foundation

struct Message: Identifiable {
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
}
