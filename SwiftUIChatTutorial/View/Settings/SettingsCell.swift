//
//  SettingsCell.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/05/31.
//

import SwiftUI

struct SettingsCell: View {
    let viewModel: SettingsCellViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6)
                    .background(viewModel.backgroundColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                Text(viewModel.title)
                    .font(.system(size: 15))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding([.top, .horizontal])
            
            Divider()
                .padding(.leading)
        }
        .background(Color.white)
    }
}

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCell(viewModel: SettingsCellViewModel.starredMessages)
    }
}
