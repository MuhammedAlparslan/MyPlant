//
//  LaunchCoordinator.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit

class LaunchCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func loginClicked() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginController") as!  LoginController
        navigationController.show(controller, sender: nil)
    }
    
    func signUpClicked() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterController") as!  RegisterController
        navigationController.show(controller, sender: nil)
    }
}
