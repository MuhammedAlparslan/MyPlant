//
//  HomeController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.06.2023.
//

import UIKit
import ProgressHUD

class HomeController: UIViewController {
    
    //    MARK: - Properties
    
    @IBOutlet private weak var homeCollection   : UICollectionView!
    @IBOutlet private weak var nameLabel        : UILabel!
    
    var viewModel                  =  HomeViewModel()
    private var cellId             = "\(HomeCell.self)"
    private let refreshController  = UIRefreshControl()
    private var coordinator: HomeCoordinator?
    
    
    
    //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTimer()
        configureUI()
        configureViewModel()
        configureCell()
        configurePage()
        
    }
    
    
    //    MARK: - Helper
    
    private func configureTimer() {
        ProgressHUD.show()
        ProgressHUD.animationType = .lineScaling
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            ProgressHUD.dismiss()
        }
    }
    
    private func configureCell() {
        homeCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    private func configurePage() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        homeCollection.refreshControl = refreshController
        homeCollection.refreshControl?.tintColor = .black
    }
    
    private func configureViewModel() {
        refreshController.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.fetchData()
        }
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.homeCollection.reloadData()
        }
    }
    
    private func configureUI() {
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.title = "Green Moon"
        navigationItem.titleView?.tintColor = .white
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Light", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
    }
    
    
    //MARK: - Selector
    
    @objc func pullToRefresh() {
        viewModel.reset()
        homeCollection.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.fetchData()
        }
    }
    
    //    MARK: - IB action
    
    
    @IBAction func speciesButton(_ sender: Any) {
        coordinator?.getSpecialClicked()
    }
    
    @IBAction func diseaseClicked(_ sender: Any) {
        coordinator?.getDisease()
        
    }
    
    @IBAction func faqClicked(_ sender: Any) {
        coordinator?.getFAQQuestion()
    }
    
    @IBAction func logout(_ sender: Any) {
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




//    MARK: - HomeControllerExtension


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        cell.configureData(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: homeCollection.frame.width, height: homeCollection.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.showPlantDetails(plantId: viewModel.items[indexPath.row].id ?? 0)
    }
}
