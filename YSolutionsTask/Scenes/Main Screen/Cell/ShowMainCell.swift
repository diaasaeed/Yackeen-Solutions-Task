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
    func rateShow(rate:Double)
}


class ShowMainCell: UITableViewCell ,ShowMainCellProtocol{

    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var titleShowLable: UILabel!
    @IBOutlet weak var runTimeShow: UILabel!
    @IBOutlet weak var linkShowLable: UILabel!
    @IBOutlet weak var premieredShowLable: UILabel!
    @IBOutlet weak var rateShowLable: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        viewCell.shadow()
    }
    
    
    func imageShow(url: String) {
        print("URL Image",url)
        if let url = URL(string:url){
            if let data = try? Data(contentsOf: url)  {
              self.imageShow.image = UIImage(data: data)
            }
        }
         
 
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
    
    func rateShow(rate: Double) {
        self.rateShowLable.text = "\(rate)"
    }
    
   
    
}
