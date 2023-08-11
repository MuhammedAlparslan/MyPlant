//
//  LoginViewModel.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//


import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage


class LoginViewModel {
    
    var adapter = LoginAdapter()
    var user: LoginUserRequest?

    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    public func signIn(with userRequest: LoginUserRequest) {
        adapter.fireBaseSignIn(with: userRequest) { result, error in
            if let error = error {
                self.errorCallback?(error.localizedDescription)
            } else  {
                UserDefaults.standard.set(result?.user.uid, forKey: "userUid")
                self.successCallback?()
            }
        }
    }
    

}
