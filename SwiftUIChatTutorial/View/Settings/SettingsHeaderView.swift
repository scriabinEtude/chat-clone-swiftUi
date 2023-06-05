//
//  SettingsHeaderView.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/05/31.
//

import SwiftUI
import Kingfisher

struct SettingsHeaderView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}

struct SettingsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsHeaderView(user: AuthViewModel.shared.testUser)
    }
}
