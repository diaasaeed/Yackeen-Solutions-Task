//
//  ShowDetailsPresenter.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation

class ShowDetailsPresenter:ShowDetailsPresenterProtocol , ShowDetailsInteractorOutpotProtocol{
  
    var view: ShowDetailsViewProtocol?
    var router:ShowDetailsRouterProtocol?
    var interactor:ShowDetailsInteractorInputProtocol?
    var error:ErrorProtocol?
    var showArray:MainScreenModelElement?
    var showURL = String()
    
    init(view: ShowDetailsViewProtocol,
         router:ShowDetailsRouterProtocol,
         interactor:ShowDetailsInteractorInputProtocol,
         error:ErrorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.error = error
    }

    
    func viewDidLoad(){
        interactor?.sendRquestShowDetails(url: showURL)
    }
    
    
    func getDataShow(model: MainScreenModelElement) {
        self.showArray = model
        self.view?.reloadData()
    }
    
}
