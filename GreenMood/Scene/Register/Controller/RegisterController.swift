//
//  RegisterController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit
import ProgressHUD
import SDWebImage
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

class RegisterController: UIViewController {
    
    //    MARK: - Properties
    @IBOutlet private weak var plusImageButton  : UIButton!
    @IBOutlet private weak var emailText        : UITextField!
    @IBOutlet private weak var passwordText     : UITextField!
    @IBOutlet private weak var fullnameText     : UITextField!
    
    private var viewModel = RegisterViewModel()
    private var profileImage : UIImage?
    private let imagePicker = UIImagePickerController()
    
    var emailAddress: String?
    var fullName:     String?
 

    
    
    //    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
        configureImagePickerDelegate()
 
    }
    
    //    MARK: - Helper
    
    func configureImagePickerDelegate() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    func configureViewModel() {
        viewModel.succesCallback = {
            self.navigationController?.popViewController(animated: true)
        }
        viewModel.errorCallback = { error in
            self.makeAlert(titleInput: "WARNING!!", messageInput: error)
        }
    }
    
    func configureUI() {
        navigationItem.hidesBackButton = true
        fullnameText.borderStyle = UITextField.BorderStyle.none
        fullnameText.layer.addSublayer(createLayer(frame: .init(x: 0,
                                                                y: fullnameText.frame.height - 5,
                                                                width: fullnameText.frame.width,
                                                                height: 1),
                                                   color: .green))
        
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
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert     = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil )
    }
    
    func configureImagePicker() {
        plusImageButton.layer.cornerRadius = 64
        plusImageButton.layer.masksToBounds = true
        plusImageButton.imageView?.contentMode = .scaleAspectFit
        plusImageButton.imageView?.clipsToBounds = true
        plusImageButton.layer.borderColor = UIColor.white.cgColor
        plusImageButton.layer.borderWidth = 3
    }
    
    
    
    //    MARK: - Button Action
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        guard let profileImage  = profileImage          else { return }
        guard let email         = emailText.text        else { return }
        guard let password      = passwordText.text     else { return }
        guard let fullname      = fullnameText.text     else { return }
        
        let credentials = Register(fullname: fullname, email: email, password: password, profileImage: profileImage)
        
        viewModel.signUpUser(data: credentials)
        ProgressHUD.show()
        ProgressHUD.animationType = .lineScaling
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            ProgressHUD.dismiss()
            
            self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - ImagePickerController

extension RegisterController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.profileImage = profileImage
        configureImagePicker()
        self.plusImageButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
        
        
    }
}


