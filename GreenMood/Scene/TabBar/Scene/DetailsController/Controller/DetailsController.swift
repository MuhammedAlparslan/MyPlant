//
//  DetailsController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 21.06.2023.
//

import UIKit
import ProgressHUD

class DetailsController: UIViewController {
    
    //    MARK: - Properties
    
    @IBOutlet private weak var detailsCollection: UICollectionView!
    
    
    let  viewModel = DetailsViewModel()
    private let  cellId = "\(DetailsCell.self)"
    
    //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTimer()
        configureUI()
        configureViewModel()
        configureNavigationTitle()
    }
    
    //    MARK: - Helper
    
    private func configureNavigationTitle() {
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.title = "About Plant"
        navigationItem.titleView?.tintColor = .green
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Light", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
    }
    
    private func configureTimer() {
        ProgressHUD.show()
        ProgressHUD.animationType = .systemActivityIndicator
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            ProgressHUD.dismiss()
        }
    }
    
    private func configureUI() {
        detailsCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        
    }
    
    private func configureViewModel() {
        viewModel.getPlantDetails()
        viewModel.successCallback = {
            self.detailsCollection.reloadData()
        }
    }
    
    
    //    MARK: - IBAction
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailsCell
        if let plant = viewModel.plant {
            cell.configureData(data: plant)
        } else {
            print("errorr")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: detailsCollection.frame.width, height: detailsCollection.frame.height)
    }
}
