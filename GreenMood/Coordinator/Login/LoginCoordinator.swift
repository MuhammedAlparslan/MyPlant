//
//  LoginCoordinator.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit

class LoginCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func registerClicked() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterController") as!  RegisterController
        navigationController.show(controller, sender: nil)
    }
    
    func googleSign(fullName: String?, emailAddress: String?) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterController") as! RegisterController
        controller.fullName = fullName
        controller.emailAddress = emailAddress
        navigationController.show(controller, sender: nil)
    }
}

