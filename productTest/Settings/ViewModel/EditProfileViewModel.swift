//
//  EditProfileViewModel.swift
//  productTest
//
//  Created by Yuta Yamada on 7/30/23.
//

import PhotosUI
import Firebase
import SwiftUI


@MainActor

class EditProfileViewModel: ObservableObject {
    @Published var currentUser: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage: Image?
    @Published var first = ""
    @Published var last = ""
    @Published var bio = ""
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return}
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    func updateUserData() async throws {
        // update profile image if changed
        
        // update first name if changed
        if !first.isEmpty && currentUser.first != first {
            print("DEBUG: Update first \(first)")
        }
        // update last name if changed
        if !last.isEmpty && currentUser.last != last {
            print("DEBUG: Update first \(first)")
        }
        
        // update bio if changed
    }
}
