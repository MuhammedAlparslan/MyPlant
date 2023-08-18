//
//  ProfileController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 11.08.2023.
//

import UIKit

class ProfileController: UIViewController {
    
    //    MARK: Properties
    
    @IBOutlet private weak var tableview: UITableView!
    
    private var  cellID =   "\(ProfileCell.self)"
    private var item = [Profile]()
    private var profile = [
        Profile(name: "Profile", image: UIImage(named: "user")),
        Profile(name: "LogOut",  image: UIImage(named: "close-2"))
    ]
    private var coordinator: HomeCoordinator?
    
    //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCoordinator()
        
    }
    
    
    //    MARK: - Helper
    
    private func configureCoordinator() {
        coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    private  func alertAction() {
        let alert = UIAlertController(title: "Warning", message: "Are you sure to log out?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = scene.delegate as? SceneDelegate {
                UserDefaults.standard.set(false, forKey: "loggedIn")
                sceneDelegate.setLoginRootController(windowScene: scene)
            }
        }
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}

//    MARK: - ProfileControllerTableView


extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! ProfileCell
        cell.configureData(data: profile[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.row == 1 {
            coordinator?.showLogOut(data: alertAction())
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

