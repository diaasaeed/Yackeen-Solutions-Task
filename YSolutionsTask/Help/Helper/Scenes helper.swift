//
//  Helper.swift
//  Q_managment
//
//  Created by Ahmed on 7/5/21.
//

import Foundation


/// Control identifiers of controllers and storyboards
struct Helper{
    
    /// the story name in enum
    var Story: StoryBoards
    
    /// view controller name in enum
    var VC: ViewControllers
}


/// enum responsible for store storybords names
enum StoryBoards: String {
    // ---- Splash ----
    case Main = "Main"

}
/// enum responsible for store view controllers names
enum ViewControllers: String {
    
    case MainScreenVC = "MainScreenVC"

 }
