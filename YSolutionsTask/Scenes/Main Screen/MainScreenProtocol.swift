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
    func configuerCell(cell:ShowMainCellProtocol,index:Int)
    func getURLShow(index:Int)->String
    func countShow()->Int
    func Select(at index:Int)
}

protocol MainScreenInteractorInputProtocol {
    var presnter:MainScreenInteractorOutputProtocol? {get set}
    func sendRquestMain(txt:String,url:String)
}

protocol MainScreenInteractorOutputProtocol {
    func getDataMain(model:[MainScreenModelElement])
}

protocol MainScreenRouterProtocol  {
    func openShow(urlShow:String)
}
