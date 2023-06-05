//
//  ChatsView.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/05/30.
//

import SwiftUI

struct ChatsView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            // messages
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(viewModel: MessageViewModel(message: message))
                    }
                }
            }
            
            // input view
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle("venom")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView(user: AuthViewModel.shared.testUser)
    }
}
