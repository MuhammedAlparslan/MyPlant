//
//  DiseaseDetailsController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.07.2023.
//

import UIKit

class DiseaseDetailsController: UIViewController {
    
//    MARK: - Properties
    
    @IBOutlet private weak var dCollectionview: UICollectionView!
    
    var viewModel       = DiseaseDetailsViewModel()
    private var cellID  = "\(DiseaseDCell.self)"
    
//    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
//    MARK: - Helper
    
    private func configureUI() {
        dCollectionview.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        
    }
}

//    MARK: - DiseaseDetailsController


extension DiseaseDetailsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DiseaseDCell
        if let item = viewModel.item {
            cell.configureData(data: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: dCollectionview.frame.width, height: dCollectionview.frame.height)
    }
}
