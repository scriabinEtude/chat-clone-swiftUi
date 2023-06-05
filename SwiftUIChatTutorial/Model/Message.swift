//
//  Message.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/01.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
