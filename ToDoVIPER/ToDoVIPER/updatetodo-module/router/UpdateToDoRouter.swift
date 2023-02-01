//
//  UpdateToDoRouter.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class UpdateToDoRouter: PresenterToRouterUpdateToDoProtocol {
    static func createModule(ref: UpdateToDoVC) {
        ref.updateToDoPresenterObject = UpdateToDoPresenter()
        ref.updateToDoPresenterObject?.updateToDoInteractor = UpdateToDoInteractor()
    }
    
    
}
