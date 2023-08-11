//
//  RegisterViewModel.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class RegisterViewModel {
    
    var data = [Register]()
    let adapter = RegisterAdapter()
    
    var succesCallback: (()->())?
    var errorCallback: ((String)->())?
    
 
    func signUpUser(data: Register) {
        adapter.registerUser(creentials: data) { error in
            if let error = error {
                self.errorCallback?(error)
            } else {
                self.succesCallback?()
            }
        }
    }
}
