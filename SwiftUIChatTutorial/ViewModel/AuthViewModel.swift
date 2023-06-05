//
//  AuthViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/01.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    public var testUser = User(username: "test", fullname: "test", email: "test", profileImageUrl: "https://item.kakaocdn.net/do/fd0050f12764b403e7863c2c03cd4d2d7154249a3890514a43687a85e6b6cc82")
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                LogUtil.error("Failed to register with error", error: error)
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempCurrentUser = user
            let data: [String: Any] = [
                "email": email,
                "username": username,
                "fullname": fullname,
                "uid": user.uid
            ]
            
            COLLECTION_USER.document(user.uid).setData(data) { _ in
                self.didAuthenticateUser = true
            }
            
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USER.document(uid).updateData(["profileImageUrl": imageUrl]) { _ in
                self.userSession = self.tempCurrentUser
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        self.didAuthenticateUser = false
        self.tempCurrentUser = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USER.document(uid).getDocument { snapshot, error in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
