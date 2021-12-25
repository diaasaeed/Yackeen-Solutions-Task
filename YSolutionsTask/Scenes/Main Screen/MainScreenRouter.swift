//
//  MainScreenRouter.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation
import UIKit
class MainScreenRouter{
    
    static func createModule()-> UIViewController{
        
        let view = SetStoryBoard.controller(controller: Helper(Story: .Main, VC: .MainScreenVC)) as! MainScreenVC
        let router = MainScreenRouter()
        let interactor = MainScreenInteractor()
        
        let presenter = MainScreenPresenter(view: view, router: router, interactor: interactor,error: view)
        presenter.interactor = interactor
        presenter.router = router
        view.presenter = presenter
        interactor.presnter = presenter
        
        return view
    }
}
