//
//  SpecialController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.06.2023.
//

import UIKit

class SpecialController: UIViewController {
    
    //    MARK: - Properties
    
    @IBOutlet private weak var searchText       : UITextField!
    @IBOutlet private weak var specialTableView : UITableView!
    
    var viewModel                   =  SearchViewModel()
    private var cellID              = "\(SpecialCell.self)"
    private let refreshController   = UIRefreshControl()
    private var coordinator: HomeCoordinator?
    
    
    //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
        configurePage()
    }
    
    
    //    MARK: - Helper
    
    private func configureUI() {
        coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())
        //        navigationItem.hidesBackButton = true
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.title = "Special"
        navigationItem.titleView?.tintColor = .green
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Light", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        refreshController.beginRefreshing()
        searchText.clearButtonMode = .whileEditing
    }
    
    private func configurePage() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        specialTableView.refreshControl = refreshController
        specialTableView.refreshControl?.tintColor = .black
    }
    
    private func configureViewModel() {
        viewModel.fetchData()
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.specialTableView.reloadData()
            print("-----")
            print(self.viewModel.text)
            print("-----")
            
        }
    }
    
    private func resetOperation() {
        viewModel.reset()
        specialTableView.reloadData()
        viewModel.fetchData()
    }
    
    
    //MARK: - Selector
    
    @objc func pullToRefresh() {
        resetOperation()
    }
    
    //    MARK: - IBAction
    
    
    @IBAction func SearchButton(_ sender: UIButton) {
        if let text = searchText.text, !text.isEmpty {
            viewModel.text = text
            print(text)
        } else {
            resetOperation()
        }
    }
}


// MARK: - SpecialControllerExtension


extension SpecialController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! SpecialCell
        cell.configureData(data: viewModel.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showPlantDetails(plantId: viewModel.items[indexPath.row].id ?? 0)
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
