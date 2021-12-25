//
//  MainScreenVC.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import UIKit

class MainScreenVC: UIViewController,MainScreenViewProtocol,ErrorProtocol {

    
    //MARK:- variable
    var presenter: MainScreenPresenterProtocol?


    //MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.presenter?.requestSearch(txt: "F")

    }    
 
 
    //MARK: - deleget protocols
    func reloadData() {
         
    }
    
    func featching(error: String) {
        showAlert(withTitle: true, msg: error, compilition: nil)

    }

}
