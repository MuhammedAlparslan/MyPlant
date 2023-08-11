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
//    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

         
    }
    
    
//    MARK: - Helper
    
    
    
    

     

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
//        coordinator?.showPlantDetails(plantId: viewModel.items[indexPath.row].id ?? 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

