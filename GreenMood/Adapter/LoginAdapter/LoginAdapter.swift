//
//  LoginAdapter.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import GoogleSignIn


enum LoginType {
    case google
    case facebook
    case apple
}


class LoginAdapter {
    
    //    var controller = LoginController()
    //
    //    init(controller: LoginController = LoginController()) {
    //        self.controller = controller
    //    }
    
    func fireBaseSignIn(with userRequest: LoginUserRequest, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password, completion: completion)
    }
    
    
    
    //        func userLogin(type: LoginType, complete: @escaping((LoginUserRequest?, String?)->())) {
    //            switch type {
    //            case .google:
    //                googleLogin(complete: complete)
    //            case .facebook:
    //                facebookLogin(complete: complete)
    //            case .apple:
    //                appleLogin(complete: complete)
    //            }
    //        }
    //
    //        private func googleLogin(complete: @escaping((LoginUserRequest?, String?)->())) {
    //            GIDSignIn.sharedInstance.signIn(withPresenting: controller) { result, error in
    //                if let error = error {
    //                    complete(nil, error.localizedDescription)
    //                } else if let result = result{
    //                    print(result.user.profile?.email ?? "")
    //                    let user = LoginUserRequest(email: result.user.profile?.email ?? "", password: "")
    //                    complete(user, nil)
    //                }
    //            }
    
    
    private func facebookLogin(complete: @escaping((LoginUserRequest?, String?)->())) {
        
    }
    
    private func appleLogin(complete: @escaping((LoginUserRequest?, String?)->())) {
        
    }
}

