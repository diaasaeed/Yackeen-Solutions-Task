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
    var showDetails:Show?
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
    
    
    func getDataShow(model: Show) {
        self.showDetails = model
        self.view?.reloadData()
    }
    
    
    func configuerImage(cell:ImageShowDetailsCellProtocol){
        cell.image(url: self.showDetails?.image?.original ?? "")
    }
    
    func configuerInfo(cell:InfoShowCellProtocol){
        cell.endDate(date: showDetails?.ended ?? "")
        cell.startDate(date: showDetails?.premiered ?? "")
        cell.lang(txt: showDetails?.language ?? "")
        cell.titleShow(title: showDetails?.name ?? "")
        cell.runtimeShow(title: "\(showDetails?.runtime ?? 0)")
    }
    
    func configuerSummary(cell:SummaryShowCellProtocol){
        cell.summaryShow(txt: showDetails?.summary ?? "")
    }
}
