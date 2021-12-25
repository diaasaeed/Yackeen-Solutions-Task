//
//  ShowDetailsVC.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import UIKit

class ShowDetailsVC: UIViewController ,ShowDetailsViewProtocol,ErrorProtocol{

    //MARK: - varible
    var presenter: ShowDetailsPresenterProtocol?
        
    //MARK:- outlet
    @IBOutlet weak var showDetailsTableView: UITableView!

   //MARK:- view did load
    override func viewDidLoad() {
        super.viewDidLoad()

        createXIB()
    }
    

    //MARK: - view will apper
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK:- functions
    func createXIB(){
        showDetailsTableView.register(UINib(nibName: "ImageShowDetailsCell", bundle: nil), forCellReuseIdentifier: "ImageShowDetailsCell")
        
        showDetailsTableView.register(UINib(nibName: "InfoShowCell", bundle: nil), forCellReuseIdentifier: "InfoShowCell")
        
        showDetailsTableView.register(UINib(nibName: "SummaryShowCell", bundle: nil), forCellReuseIdentifier: "SummaryShowCell")
        
    }
 
    //MARK:- deleget
    func reloadData() {
        showDetailsTableView.reloadData()
    }
    
    func featching(error: String) {
         
    }
    
}

//MARK:- tableview

extension ShowDetailsVC : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = self.showDetailsTableView.dequeueReusableCell(withIdentifier: "ImageShowDetailsCell") as! ImageShowDetailsCell
            self.presenter?.configuerImage(cell: cell)
            return cell
        }else if indexPath.row == 1{
            let cell =   self.showDetailsTableView.dequeueReusableCell(withIdentifier: "InfoShowCell") as! InfoShowCell
            self.presenter?.configuerInfo(cell: cell)
            return cell
        }else{
            let cell =   self.showDetailsTableView.dequeueReusableCell(withIdentifier: "SummaryShowCell") as! SummaryShowCell
            self.presenter?.configuerSummary(cell: cell)
            return cell
        }
    }
    
    
    
}
