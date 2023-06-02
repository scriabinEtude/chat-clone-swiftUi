//
//  RegistrationView.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/05/26.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        VStack{
            
            NavigationLink(
                destination: ProfilePhotoSelectorView().navigationBarBackButtonHidden(true),
                isActive: $viewModel.didAuthenticateUser,
                label: {}
            )
            
            VStack(alignment: .leading, spacing: 12) {
                HStack { Spacer() }
                Text("Get started.")
                    .font(.largeTitle)
                    .bold()
                Text("Create your account.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                VStack(spacing: 32) {
                    CustomTextField(
                        imageName: "envelope",
                        placeholderText: "email",
                        isSecureField: false,
                        text: $email
                    )
                    CustomTextField(
                        imageName: "person",
                        placeholderText: "Username",
                        isSecureField: false,
                        text: $username
                    )
                    CustomTextField(
                        imageName: "person",
                        placeholderText: "Full Name",
                        isSecureField: false,
                        text: $fullname
                    )
                    CustomTextField(
                        imageName: "lock",
                        placeholderText: "Password",
                        isSecureField: true,
                        text: $password
                    )
                }
                .padding([.top, .horizontal], 32)
            }
            .padding(.leading)
            Button(action: {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })
            .padding(.top, 24)
            .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
            Spacer()
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
            })
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
