//
//  SummaryShowCell.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import UIKit

protocol  SummaryShowCellProtocol {
    func summaryShow(txt:String)
}
class SummaryShowCell: UITableViewCell,SummaryShowCellProtocol {

    @IBOutlet weak var summaryTitleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func summaryShow(txt:String){
        summaryTitleLable.attributedText = txt.convertHtmlToNSAttributedString
    }
    
}



extension String {
    public var convertHtmlToNSAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data,options: [.documentType: NSAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }

    public func convertHtmlToAttributedStringWithCSS(font: UIFont? , csscolor: String , lineheight: Int, csstextalign: String) -> NSAttributedString? {
        guard let font = font else {
            return convertHtmlToNSAttributedString
        }
        let modifiedString = "<style>body{font-family: '\(font.fontName)'; font-size:\(font.pointSize)px; color: \(csscolor); line-height: \(lineheight)px; text-align: \(csstextalign); }</style>\(self)";
        guard let data = modifiedString.data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error)
            return nil
        }
    }
}
