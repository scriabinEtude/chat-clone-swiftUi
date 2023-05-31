//
//  SettingsHeaderView.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/05/31.
//

import SwiftUI


struct SettingsHeaderView: View {
    var body: some View {
        HStack {
            Image("venom-7")
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Eddie Brock")
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
        SettingsHeaderView()
    }
}
