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

    //MARK:- outlet
    @IBOutlet weak var showTableView: UITableView!
    
    //MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
 
        createXIB()
        self.presenter?.requestSearch(txt: "Future")

    }    
 
 
    func createXIB(){
        showTableView.rowHeight = 130
        showTableView.delegate = self
        showTableView.dataSource = self
        self.showTableView.register(UINib(nibName: "ShowMainCell", bundle: nil), forCellReuseIdentifier: "ShowMainCell")
    }
    
    //MARK: - deleget protocols
    func reloadData() {
        showTableView.reloadData()
    }
    
    func featching(error: String) {
        showAlert(withTitle: true, msg: error, compilition: nil)

    }

}

extension MainScreenVC :UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.countShow() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.showTableView.dequeueReusableCell(withIdentifier: "ShowMainCell", for: indexPath) as! ShowMainCell
        self.presenter?.configuerCell(cell: cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlShow = self.presenter?.getURLShow(index: indexPath.row) ?? ""
        let detail = ShowDetailsRouter.createModule(urlShow: urlShow) as! ShowDetailsVC
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    
}
