//
//  MainScreenProtocol.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation

protocol MainScreenViewProtocol {
    var presenter:MainScreenPresenterProtocol? {get set}
    func reloadData()
}

protocol MainScreenPresenterProtocol {
    var view:MainScreenViewProtocol? {get set}
    func requestSearch(txt:String)

}

protocol MainScreenInteractorInputProtocol {
    var presnter:MainScreenInteractorOutputProtocol? {get set}
    func sendRquestMain(txt:String,url:String)
}

protocol MainScreenInteractorOutputProtocol {
    func getDataMain(model:[MainScreenModelElement])
}

protocol MainScreenRouterProtocol  {
    
}
