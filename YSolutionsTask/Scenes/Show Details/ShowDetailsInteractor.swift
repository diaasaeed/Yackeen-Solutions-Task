//
//  ShowDetailsInteractor.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation

class ShowDetailsInteractor:ShowDetailsInteractorInputProtocol{
    
    var presnter: ShowDetailsInteractorOutpotProtocol?
    var error: ErrorProtocol?
    
    func sendRquestShowDetails(url:String){
        API.sharedInstance.getRequest(url: url) {  [weak self] (data:Show?, statusCode, error) in
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
                self?.presnter?.getDataShow(model: data)
            }
        }
    }
    
}
