//
//  ConversationsView.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/05/31.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showNewMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink(
                    destination: ChatsView(user: user),
                    isActive: $showChatView,
                    label: {}
                )
            }
            
            // chats
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.recentMessages) { message in
                        ConversationCell(
                            viewModel: ConversationCelViewModel(message)
                        )
                    }
                }
            }
            
            // floating button
            Button(action: {
                showNewMessageView.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $showNewMessageView, content: {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            })
        }
        .onAppear{
            viewModel.fetchRecentMessages()
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
