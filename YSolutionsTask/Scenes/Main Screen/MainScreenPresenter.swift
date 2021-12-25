//
//  MainScreenPresenter.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation

class MainScreenPresenter:MainScreenPresenterProtocol , MainScreenInteractorOutputProtocol{
  
    var view: MainScreenViewProtocol?
    var router:MainScreenRouterProtocol?
    var interactor:MainScreenInteractorInputProtocol?
    var error:ErrorProtocol?
    var showArray = [MainScreenModelElement]()
    
    init(view: MainScreenViewProtocol,
         router:MainScreenRouterProtocol,
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
        self.view?.reloadData()
        print("Count array is",showArray.count  )
    }
    
    
    
    func countShow()->Int{
        return self.showArray.count
    }
    
    func getURLShow(index:Int)->String{
        return self.showArray[index].show?.links?.linksSelf?.href ?? ""
    }
    
    func configuerCell(cell:ShowMainCellProtocol,index:Int){
        let data = self.showArray[index].show
        cell.imageShow(url: data?.image?.medium ?? "")
        cell.linkShow(url: data?.links?.linksSelf?.href ?? "")
        cell.premieredShow(date: data?.premiered ?? "")
        cell.rateShow(rate: data?.rating?.average ?? 0)
        cell.runtimeShow(time: data?.runtime ?? 0)
        cell.titleShow(title: data?.name ?? "")
    }
    
    func Select(at index:Int){
        let url = self.getURLShow(index: index)
        self.router?.openShow(urlShow: url)
    }
}
