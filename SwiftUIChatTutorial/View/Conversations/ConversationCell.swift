//
//  UserCell.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/01.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    @ObservedObject var viewModel: ConversationCelViewModel
    
    var body: some View {
        if let user = viewModel.message.user {
            NavigationLink(destination: ChatsView(user: user)) {
                VStack {
                    HStack {
                        // image
                        KFImage(viewModel.chatPartnerProfileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        // message info
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.fullname)
                                .font(.system(size: 14, weight: .semibold))
                            Text(viewModel.message.text)
                                .font(.system(size: 15))
                        }.foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                }
                .padding(.top)

            }
        }
    }
}
