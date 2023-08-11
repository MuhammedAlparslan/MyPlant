//
//  FaqDetailsController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.07.2023.
//

import UIKit

class FaqDetailsController: UIViewController {

//    MARK: - Properties
    
    @IBOutlet private weak var faqCollectionView: UICollectionView!
    
    var viewModel = FaqDetailsViewModel()
    private var cellID = "\(FaqDetailsCell.self)"
    private var coordinator: HomeCoordinator?

    //    MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //    MARK: - Helper

    private func configureUI() {
        faqCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())

        
    }
    
}

//    MARK: - FaqDetailsController


extension FaqDetailsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FaqDetailsCell
        if let item = viewModel.item {
            cell.configureData(data: item)
        }
        return cell
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: faqCollectionView.frame.width, height: faqCollectionView.frame.height)
    }
}
