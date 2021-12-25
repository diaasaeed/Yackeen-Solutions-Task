//
//  MainScreenPresenter.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation

class MainScreenPresenter:MainScreenPresenterProtocol , MainScreenInteractorOutputProtocol{
  
    var view: MainScreenViewProtocol?
    var router:MainScreenRouter?
    var interactor:MainScreenInteractorInputProtocol?
    
    init(view: MainScreenViewProtocol,
         router:MainScreenRouter,
         interactor:MainScreenInteractorInputProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    
    func getDataMain(model: [MainScreenModelElement]) {
        
    }
    
    
    
}
