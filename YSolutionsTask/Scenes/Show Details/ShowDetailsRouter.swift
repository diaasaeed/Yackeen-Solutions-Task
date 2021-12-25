//
//  ShowDetailsRouter.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation
import UIKit
class ShowDetailsRouter: ShowDetailsRouterProtocol{
    
    static func createModule(urlShow:String)-> UIViewController{
        
        let view = SetStoryBoard.controller(controller: Helper(Story: .Main, VC: .ShowDetailsVC)) as! ShowDetailsVC
        let router = ShowDetailsRouter()
        let interactor = ShowDetailsInteractor()
        
        let presenter = ShowDetailsPresenter(view: view, router: router, interactor: interactor,error: view)
        presenter.interactor = interactor
        presenter.showURL = urlShow
        presenter.router = router
        view.presenter = presenter
        interactor.presnter = presenter
        
        return view
    }
}
