//
//  ShowDetailsProtocol.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation

protocol ShowDetailsViewProtocol {
    var presenter:ShowDetailsPresenterProtocol? {get set}
    func reloadData()
}


protocol ShowDetailsPresenterProtocol {
    var view:ShowDetailsViewProtocol? {get set}
    func viewDidLoad()
    func configuerImage(cell:ImageShowDetailsCellProtocol)
    func configuerInfo(cell:InfoShowCellProtocol)
    func configuerSummary(cell:SummaryShowCellProtocol)
}

protocol ShowDetailsInteractorInputProtocol {
    var presnter:ShowDetailsInteractorOutpotProtocol? {get set }
    func sendRquestShowDetails(url:String)
}

protocol ShowDetailsInteractorOutpotProtocol {
    func getDataShow(model:Show)

}

protocol ShowDetailsRouterProtocol {
     //TODO:- 
}

