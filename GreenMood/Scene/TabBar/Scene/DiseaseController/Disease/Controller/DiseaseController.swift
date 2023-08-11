//
//  DiseaseController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 30.06.2023.
//

import UIKit

class DiseaseController: UIViewController {
    
    //    MARK: - Properties
    
    @IBOutlet private weak var searhTextField   : UITextField!
    @IBOutlet private weak var diseaseTableView : UITableView!
    
    var viewModel                   = DiseaseViewModel()
    private var cellID              = "\(DiseaseCell.self)"
    private let refreshController   = UIRefreshControl()
    private var coordinator: HomeCoordinator?
    
    
    //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
        configurePage()
        clearSearchText()
        
    }
    
    //    MARK: - Helper
    
    private func configureUI() {
        coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())
        
    }
    
    private func clearSearchText() {
        refreshController.beginRefreshing()
        viewModel.reset()
        searhTextField.clearButtonMode = .whileEditing
    }
    
    private func configurePage() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        diseaseTableView.refreshControl = refreshController
        diseaseTableView.refreshControl?.tintColor = .black
    }
    
    private func configureViewModel() {
        viewModel.fetchData()
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.diseaseTableView.reloadData()
        }
    }
    
    //    MARK: - Selector
    
    @objc func pullToRefresh() {
        viewModel.reset()
        diseaseTableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.fetchData()
        }
    }
    
    //    MARK: - @IBAction
    
    @IBAction func seacrhClicked(_ sender: UITextField) {
        viewModel.text = sender.text ?? ""
    }
}

// MARK: - SpecialControllerExtension

extension DiseaseController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! DiseaseCell
        cell.configureData(data: viewModel.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showPlantDetails(data: viewModel.items[indexPath.item])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.row)
        
    }
    
}

