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
    var error:ErrorProtocol?
    var showArray = [MainScreenModelElement]()
    
    init(view: MainScreenViewProtocol,
         router:MainScreenRouter,
         interactor:MainScreenInteractorInputProtocol,
         error:ErrorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.error = error
    }
    
    func requestSearch(txt:String){
        interactor?.sendRquestMain(txt: txt, url: "http://api.tvmaze.com/search/shows")
    }
    
    func getDataMain(model: [MainScreenModelElement]) {
        self.showArray.append(contentsOf: model)
        print("Count array is",showArray.count  )
    }
    
    
    
}
