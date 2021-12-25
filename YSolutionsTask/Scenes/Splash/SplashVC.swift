//
//  SplashVC.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        open()
    }
    
    
    func open(){
        let controller = MainScreenRouter.createModule()
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setNavigationBarHidden(true, animated: false)
        let Delegate = UIApplication.shared.delegate as! AppDelegate
        Delegate.window?.rootViewController = navigationController
     }

 
}
