//
//  ChatViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/01.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    init() {
        
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
    }
}
