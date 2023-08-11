//
//  HomeCoordinator.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 22.06.2023.
//

import UIKit


class HomeCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showPlantDetails(plantId: Int) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsController") as! DetailsController
        controller.viewModel.plantID = plantId
        navigationController.show(controller, sender: nil)
    }
    
    func getSpecialClicked() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SpecialController") as! SpecialController
        navigationController.show(controller, sender: nil)
    }
    
    func getDisease() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DiseaseController") as! DiseaseController
        navigationController.show(controller, sender: nil)
    }
    
    func getFAQQuestion() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FAQController") as! FAQController
        navigationController.show(controller, sender: nil)
    }
    
    func showPlantDetails(data: DiseaseElement) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DiseaseDetailsController") as! DiseaseDetailsController
        controller.viewModel.item = data
        navigationController.show(controller, sender: nil)
    }
    
    func showFagAnswer(data: FAQElement) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FaqDetailsController") as! FaqDetailsController
        controller.viewModel.item = data
        navigationController.show(controller, sender: nil)
    }
}
