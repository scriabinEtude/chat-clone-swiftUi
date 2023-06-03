//
//  SettingsView.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/05/30.
//

import SwiftUI

struct SettingsView: View {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(spacing: 32) {
                NavigationLink(destination: EditProfileView(), label: {
                    SettingsHeaderView(user: user)
                })
                
                VStack(spacing: 1) {
                    ForEach (SettingsCellViewModel.allCases, id: \.self) { viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
                
                Button(action: {
                    AuthViewModel.shared.signout()
                }, label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)
                })
                Spacer()
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(user: AuthViewModel.shared.testUser)
    }
}
