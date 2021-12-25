//
//  ImageShowDetailsCell.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import UIKit

protocol  ImageShowDetailsCellProtocol{
    func image(url:String)
}
class ImageShowDetailsCell: UITableViewCell ,ImageShowDetailsCellProtocol{

    @IBOutlet weak var ImageShow: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none

    }

  
    func image(url:String)   {
        if let url = URL(string:url){
            if let data = try? Data(contentsOf: url)  {
              self.ImageShow.image = UIImage(data: data)
            }
        }
    }
}
