//
//  LaunchScreenController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit

class LaunchScreenController: UIViewController {
    
    //    MARK:  - Properties
    
    private var coordinator: LaunchCoordinator?
    private var counter = 0
    
    
    //    MARK: - LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCoordinator()
    }
    
    //    MARK: - Helper
    
    func configureCoordinator() {
        coordinator = LaunchCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
//    MARK: - ButtonAction
    
    @IBAction func startedClicked(_ sender: Any) {
        coordinator?.signUpClicked()
    }
    
    
    @IBAction func alreadyClicked(_ sender: Any) {
        if counter == 0 {
            UserDefaults.standard.set(true, forKey: "onboardingPassed")
            coordinator?.loginClicked()
        }
    }
}
