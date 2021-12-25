//
//  InfoShowCell.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import UIKit

protocol InfoShowCellProtocol {
    func titleShow(title:String)
    func runtimeShow(title:String)
    func lang(txt:String)
    func startDate(date:String)
    func endDate(date:String)
}

class InfoShowCell: UITableViewCell,InfoShowCellProtocol {

    @IBOutlet weak var titleShowLable: UILabel!
    @IBOutlet weak var runTimeShowLable: UILabel!
    @IBOutlet weak var languageLable: UILabel!
    @IBOutlet weak var startTimeLable: UILabel!
    @IBOutlet weak var endedTimeLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func titleShow(title:String){
        self.titleShowLable.text = title
    }
    
    func runtimeShow(title:String){
        let run = "Runtime :"
        self.runTimeShowLable.text = "\(run) \(title)"
    }
    
    func lang(txt:String){
        let lang = "Language :"

        self.languageLable.text = "\(lang) \(txt)"
    }
    
    func startDate(date:String){
        let start = "Start Date :"
        self.startTimeLable.text = "\(start) \(date)"
    }
    
    func endDate(date:String){
        let end = "ended Date :"

        self.endedTimeLable.text = "\(end) \(date)"
    }
 
    
}
