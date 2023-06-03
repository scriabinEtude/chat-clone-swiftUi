//
//  User.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/03.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}
