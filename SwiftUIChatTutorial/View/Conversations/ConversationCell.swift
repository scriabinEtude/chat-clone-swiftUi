//
//  UserCell.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/01.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack {
                // image
                Image("venom-7")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                // message info
                VStack(alignment: .leading, spacing: 4) {
                    Text("Eddie Brock")
                        .font(.system(size: 14, weight: .semibold))
                    Text("This is some test message for now..")
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

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
