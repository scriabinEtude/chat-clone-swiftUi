//
//  ConversationCellViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/05.
//

import SwiftUI

class ConversationCelViewModel: ObservableObject {
    @Published var message: Message
    
    init(_ message: Message) {
        self.message = message
        fetchUser()
    }
    
    var chatPartnerId: String {
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let user = message.user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    
    var fullname: String {
        guard let user = message.user else { return "" }
        return user.fullname
    }
    
    func fetchUser() {
        COLLECTION_USER.document(chatPartnerId).getDocument { snapshot, error in
            self.message.user = try? snapshot?.data(as: User.self)
        }
    }
}
