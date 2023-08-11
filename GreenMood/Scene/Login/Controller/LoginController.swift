//
//  LoginController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit
import Lottie
import ProgressHUD
import GoogleSignIn
import FirebaseAuth
import FirebaseCore

class LoginController: UIViewController {
    
    //    MARK: - Properties
    
    @IBOutlet private weak var loginAnimationView   : LottieAnimationView!
    @IBOutlet private weak var emailText            : UITextField!
    @IBOutlet private weak var passwordText         : UITextField!
    @IBOutlet private weak var loginAnimation       : LottieAnimationView!
    
    private var coordinator: LoginCoordinator?
    private var viewModel  = LoginViewModel()
    
     //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationMove()
        configureUI()
        configureCoordinator()
        configureViewModel()
    }
    
//    MARK: - Helper
    
    func configureViewModel() {
        viewModel.errorCallback = { error in
            self.makeAlert(titleInput: "WARNING", messageInput: error)
        }
        
        viewModel.successCallback = {
            ProgressHUD.show()
            ProgressHUD.animationType = .lineScaling
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                ProgressHUD.dismiss()

                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    if let sceneDelegate: SceneDelegate = (scene.delegate as? SceneDelegate) {
                        UserDefaults.standard.set(true, forKey: "loggedIn")
                        sceneDelegate.setTabbarRootController(windowScene: scene)
                    }
                }
            }
        }
    }
    
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert     = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil )
    }
    
    func configureCoordinator() {
        coordinator = LoginCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    func animationMove() {
        loginAnimation.contentMode =    .scaleAspectFill
        loginAnimation.loopMode    =    .loop
        loginAnimation.play()
    }
    
    func configureUI() {
        navigationItem.hidesBackButton = true
        passwordText.isSecureTextEntry = true
        emailText.borderStyle = UITextField.BorderStyle.none
        emailText.layer.addSublayer(createLayer(frame: .init(x: 0,
                                                                y: emailText.frame.height - 5,
                                                                width: emailText.frame.width,
                                                                height: 1),
                                                   color: .green))
        
        passwordText.borderStyle = UITextField.BorderStyle.none
        passwordText.layer.addSublayer(createLayer(frame: .init(x: 0,
                                                                y: passwordText.frame.height - 5,
                                                                width: passwordText.frame.width,
                                                                height: 1),
                                                   color: .green))
    }
    
    func createLayer(frame: CGRect, color: UIColor) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = color.cgColor
        return layer
    }
    
//    MARK: - ActionButton
    
    

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        guard let email     = emailText.text    else { return }
        guard let password  = passwordText.text else { return }
        
        viewModel.signIn(with: LoginUserRequest(email: email, password: password))
    }
    
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        coordinator?.registerClicked()
    }
    
    @IBAction func forgotButtonClicked(_ sender: Any) {
    }
    
    
    @IBAction func googleClicked(_ sender: Any) {
//        viewModel.login(type: .google)
    }
    
    
    @IBAction func appleClicked(_ sender: Any) {
//        viewModel.login(type: .apple)

    }
    
    @IBAction func facebookClicked(_ sender: Any) {
//        viewModel.login(type: .facebook)

    }
}
