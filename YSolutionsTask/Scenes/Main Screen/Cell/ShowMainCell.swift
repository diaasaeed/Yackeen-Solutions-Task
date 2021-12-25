//
//  ShowMainCell.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import UIKit

protocol ShowMainCellProtocol {
    func imageShow(url:String)
    func titleShow(title:String)
    func runtimeShow(time:Int)
    func linkShow(url:String)
    func premieredShow(date:String)
    func rateShow(rate:Int)
}
class ShowMainCell: UITableViewCell ,ShowMainCellProtocol{

    @IBOutlet var imageShow: UIImageView!
    @IBOutlet var titleShowLable: UILabel!
    @IBOutlet var runTimeShow: UILabel!
    @IBOutlet var linkShowLable: UILabel!
    @IBOutlet var premieredShowLable: UILabel!
    @IBOutlet var rateShowLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    func imageShow(url: String) {
         
    }
    
    func titleShow(title: String) {
        self.titleShowLable.text = title
    }
    
    func runtimeShow(time: Int) {
        let runTime = "Run time :"
        self.runTimeShow.text = "\(runTime) \(time)"
    }
    
    func linkShow(url: String) {
        self.linkShowLable.text = url
    }
    
    func premieredShow(date: String) {
        premieredShowLable.text = date
    }
    
    func rateShow(rate: Int) {
        self.rateShowLable.text = "\(rate)"
    }
    
   
    
}
