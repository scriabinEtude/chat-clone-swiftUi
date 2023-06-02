//
//  ContentsView.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/02.
//

import SwiftUI

struct ContentsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsView()
    }
}
