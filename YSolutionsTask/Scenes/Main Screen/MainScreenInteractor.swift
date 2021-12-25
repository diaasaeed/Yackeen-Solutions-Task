//
//  MainScreenInteractor.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation

class MainScreenInteractor:MainScreenInteractorInputProtocol{
    
    var presnter: MainScreenInteractorOutputProtocol?
    var error: ErrorProtocol?

    
    func sendRquestMain(txt:String,url:String){
        let url = "\(url)?q=\(txt)"
        API.sharedInstance.getRequest(url: url) {  [weak self] (data:[MainScreenModelElement]?, statusCode, error) in
            if let error = error{
                ErrorHandler.handler(error: error, statusCode: statusCode) { (localizedError) in
                    self?.error?.featching(error: localizedError)
                } sessionExpired:{
                    self?.error?.sessionExpired?()
                }
            }else if statusCode == 401{
                self?.error?.sessionExpired?()
            }else if statusCode == 400 || statusCode == 405{
                self?.error?.featching(error: "Bad Requst")
            }else if let data = data{
                self?.presnter?.getDataMain(model: data)
             }
        }
    }
}
