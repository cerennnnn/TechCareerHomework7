//
//  HomePageRouter.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class HomePageRouter: PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomeToDoVC) {
        //1 for view, 1 for interactor, 2 for presenter
        
        let presenter = HomePagePresenter()
        ref.homePagePresenterObject = presenter //presenter object in home page
        
        ref.homePagePresenterObject?.homePageInteractor = HomePageInteractor()
        ref.homePagePresenterObject?.homePageView = ref //HomeToDoVC
        
        ref.homePagePresenterObject?.homePageInteractor?.homePagePresenter = presenter
        
    }
}
