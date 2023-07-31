//
//  ImageUploader.swift
//  productTest
//
//  Created by Yuta Yamada on 7/30/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        // grabbing image data from UIImage parameter
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        
        // putting it into Storage
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "profile_image/\(filename)")
        
        do {
            let _  = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
