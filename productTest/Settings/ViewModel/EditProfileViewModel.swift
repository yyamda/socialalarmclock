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
    
    private var uiImage: UIImage?
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    // updates profile image to the selected image on UI
    func loadImage(fromItem item: PhotosPickerItem?) async {
        print("DEBUG: THIS IS STARTED")
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        print("DEBUG: THIS IS STARTED 2")
        guard let uiImage = UIImage(data: data) else { return}
        self.uiImage = uiImage
        print("DEBUG: THIS IS STARTED 3")
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        // update profile image if changed
        if let uiImage = uiImage {
            // getting imageUrl to be stored to Database
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        // update first name if changed
        if !first.isEmpty && currentUser.first != first {
            print("DEBUG: Update first \(first)")
            data["first"] = first
           
        }
        // update last name if changed
        if !last.isEmpty && currentUser.last != last {
            print("DEBUG: Update first \(last)")
            data["last"] = last
            
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(currentUser.id).updateData(data)
            
            print("This is done")
        }
    }
}
