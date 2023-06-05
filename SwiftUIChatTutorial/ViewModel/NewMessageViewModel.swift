//
//  NewMessageViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by escher on 2023/06/03.
//

import SwiftUI
import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USER.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
                .filter({ $0.id != Auth.auth().currentUser?.uid })
//            documents.forEach { document in
////                guard let user = document.data(as: User.self) else { return }
////                self.users.append(user)
//            }
        }
    }
}
