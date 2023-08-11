//
//  FAQController.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.07.2023.
//

import UIKit

class FAQController: UIViewController {
    
//    MARK: - Properties
    
    @IBOutlet private weak var faqTableView: UITableView!
    
    var viewModel        = FAQViewModel()
    private var cellID   = "\(FAQCell.self)"
    private var coordinator: HomeCoordinator?
    
    private let refreshController = UIRefreshControl()
    
    //    MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
        configurePage()
        configureCoordinator()
        
        
    }
    
    private func configureUI() {
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.title = "Question"
        navigationItem.titleView?.tintColor = .green
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Light", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        refreshController.beginRefreshing()
        
    }
    
    private func configureCoordinator() {
        coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())
        
    }
    
    private func configurePage() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        faqTableView.refreshControl = refreshController
        faqTableView.refreshControl?.tintColor = .black
    }
    
    private func configureViewModel() {
        viewModel.fetchData()
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.faqTableView.reloadData()
        }
    }
    
    private func resetOperation() {
        viewModel.reset()
        faqTableView.reloadData()
        viewModel.fetchData()
    }
    
    
    //MARK: - Selector
    
    @objc func pullToRefresh() {
        resetOperation()
    }
}

//    MARK: - FAQController


extension FAQController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! FAQCell
        cell.configureData(data: viewModel.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showFagAnswer(data: viewModel.items[indexPath.row])
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
