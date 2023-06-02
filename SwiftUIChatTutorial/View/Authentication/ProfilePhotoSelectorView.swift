//
//  ProfilePhotoSelectorView.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/02.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack {
            Button(action: imagePickerPresented.toggle, label: {
                if let profileImage = profileimage {
                    profileImage
                        
                }
            })
        }
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
