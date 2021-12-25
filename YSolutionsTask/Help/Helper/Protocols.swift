//
//  Protocols.swift
//  Q_managment
//
//  Created by Ahmed on 8/5/21.
//

import Foundation

/// protocol used for error condion from API
@objc protocol ErrorProtocol: class{
    
    /// impelimentation for API from errors
    /// - Parameter error: error message description
    func featching(error: String)
    
    /// session of the user is expired and need to login again
    @objc optional func sessionExpired()
}


//extension ErrorProtocol{
//    
//    /// featch error with status code
//    /// - Parameters:
//    ///   - error: error string
//    ///   - StatusCode: api response status code
//    func featching(error: String, StatusCode: Int){}
//    
//    
////    /// session of the user is expired and need to login again
////    func sessionExpired() {}
//}
