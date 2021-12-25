//
//  enums.swift
//  employee
//
//  Created by Ahmed on 2/16/21.
//

import Foundation
import UIKit

//MARK: - errors
/// the standard validations error types
enum errors: String{
    case empty = "Empty",
         weakPass = "Weak password",
         invalidEmail = "Invalid Email",
         passwordMisMatch = "passMisMatch",
         invalidCode = "invalidCode",
         imgsEmpty = "imgInvalid",
         invalidDate = "invalidDate",
         invalidTimePeriod = "invalidTime",
         policyAgree = "policyAgree",
         invalidPass = "passInvalid"
}

/// the standard API statuscode error types
enum APIErrors{
    case Badrequest,
         ServerError,
         UnKnownError(_ errorStr: String),
         noInternet
    
    /// get the error description localized
    var localizedErrorDescription: String{
        switch self{
        case .Badrequest: return "Bad request".localized
        case .ServerError: return "Server error".localized
        case .UnKnownError(let error): return error
        case.noInternet: return "no Internet".localized
        }
    }
}

//MARK: - pagination mode
/// get the API data list with pagination or all data
/// if on -> will set page items to 25 items
/// if off -> will set the page items to 0 items
enum PaginationStyle: String{
    case on = "25"
    case off = "0"
}


//MARK: - custome navigation bar Style
/// custome navigation View Image style
enum navigationStyle: String{
    case mega = "nav-mega"
    case medium = "nav-medium"
    case small = "nav-small"
    
    /// get the suitable image for each size
    /// - Returns: image
    func getImage() -> UIImage{
        return UIImage(named: self.rawValue)!
    }
    
    
    /// get the heught of custom navigation view
    /// - Returns: height of the view
    func getHeight() -> CGFloat{
        switch self {
        case .mega:
            return 325
            
        case .medium:
            return 160
            
        case .small:
            return 135
        }
    }
}

//MARK: - options
/// options for more button in cell
enum options{
    case edit
    case delete
}


/// type of options in item
enum CRUDType{
    case add
    case edit
    case delete
    
    /// get the screen title depends on type of the crud
    /// - Parameter screen: screen base name
    /// - Returns: title of the screen
    func getTitle(screen:  String) -> String{
        switch self {
        case .add: return "\("add".localized) \(screen)"
        case .edit: return "\("edit".localized) \(screen)"
        case .delete: return ""
        }
    }
    
    /// the sumbit button title depends on type
    /// - Returns: the button title
    func getBtnTitle() -> String{
        switch self {
        case .add: return "submit".localized
        case .edit: return "saveChanges".localized
        case .delete: return ""
        }
    }
}

//MARK: - type tickets

