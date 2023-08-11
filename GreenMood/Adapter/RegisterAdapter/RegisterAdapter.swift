//
//  RegisterAdapter.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class RegisterAdapter {
    
    func registerUser(creentials: Register, completion: @escaping (String?) -> Void) {
        let email    = creentials.email
        let password = creentials.password
        let fullname = creentials.fullname
        
        guard let imageData = creentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(fileName)
        
        storageRef.putData(imageData, metadata: nil)  { (meta, error) in
            storageRef.downloadURL { url, error in
                guard let profileImageURL = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        completion(error.localizedDescription)
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    let values  = [
                        "fullname" : fullname,
                        "email" : email,
                        "password" : password,
                        "profileImage" : profileImageURL
                    ]
                    
                    REF_USERS.child(uid).updateChildValues(values)
                    completion(nil)
                }
            }
        }
    }
}
