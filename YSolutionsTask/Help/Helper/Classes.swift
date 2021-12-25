//
//  Classes.swift
//  test app 2
//
//  Created by Ahmed on 2/10/21.
//

import Foundation
import UIKit



/// class for using storyBoard
class SetStoryBoard{
    
    /// function to return the UIViewcontroller depends on storyBoard name and VC name
    /// - Parameters:
    ///   - controller: structure contain controiller identifire and its storyboard
    ///   - story: storyBoard name
    /// - Returns: the view controller
    class func controller(controller: Helper) -> UIViewController{
        return UIStoryboard(name: controller.Story.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: controller.VC.rawValue)
    }
    
    /// function to return the UIViewcontroller depends on storyBoard name and VC name
    /// - Parameters:
    ///   - controller: structure contain controiller identifire and its storyboard
    ///   - compilition: A closure to call
    ///   - controller: the view controller that get from closure
    class func controller(controller: Helper, compilition: (_ controller: UIViewController) -> Void){
        let storyBoard = UIStoryboard(name: controller.Story.rawValue, bundle: Bundle.main)
        let controller = storyBoard.instantiateViewController(withIdentifier: controller.VC.rawValue)
        compilition(controller)
    }
}


/// class to control current date
class currentDate{
    
    /// func to get current Date
    /// - Returns: date of now
    private static func getCurrentDate() -> Date{
        return Date()
    }
    

    /// use formatter on current date to get it in localized formate or in custome formate
    /// - Parameter formate: the custom formate that convert the date to
    /// - Returns: return the formated date
    class func Current(formate: String? = nil) -> String{
        let formatter = DateFormatter()
        formatter.locale = NSLocale.init(localeIdentifier: app_lang) as Locale
        
        if let formate = formate{
            formatter.dateFormat = formate
        }
        
        return formatter.string(from: getCurrentDate())
    }
}


///control the push or pop animation dirction
class pushView{
    
    ///get the animation transition.
    ///- Parameter direction: the direction that i want to start animation from.
    ///- Returns:  the animation transition.
    class func getAnimation(direction: CATransitionSubtype) -> CAAnimation{
        let transition = CATransition.init()
        transition.duration = 0.45
        transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.push //Transition you want like Push, Reveal
        transition.subtype = direction // Direction like Left to Right, Right to Left
        return transition
    }
}


/// custome stuct for pass parameter object to display function
struct Shadow{
    
    /// color of the shadow
    var color: UIColor
    
    /// offset of the shadow
    /// ''''''''' width -> is for horizontal {+ : UP & - : DOWN  } ''''''''''''
    /// ''''''''' height -> for vertical {+ : UP & - : DOWN  } ''''''''''''
    var offset: CGSize
    
    /// opacity of color
    var opacity: Float
    
    /// spread of the
    var radius: CGFloat
}


/// structure of validator result
struct ValidatorResponse: Codable{
    
    /// error if existatnce
    var error: Bool?
    
    /// error message description if there is error found
    var msg: String?
}


/// error handler model
struct ErrorHandler{
    
    /// handle error depends on status Code
    /// - Parameter statusCode: response status code
    /// - Returns: error String
    static func handler(error: Error, statusCode: Int?, errorSession: (_ error: String) -> Void, sessionExpired: () -> Void){
        guard let code = statusCode else {
            errorSession(APIErrors.noInternet.localizedErrorDescription)
            return
        }
        switch code{
        case 403: sessionExpired()
        case let value where value >= 500: errorSession(APIErrors.ServerError.localizedErrorDescription)
        case let value where value >= 400 && value < 500: errorSession(APIErrors.Badrequest.localizedErrorDescription)
        default: errorSession(APIErrors.UnKnownError(error.localizedDescription).localizedErrorDescription)
        }
    }
}
