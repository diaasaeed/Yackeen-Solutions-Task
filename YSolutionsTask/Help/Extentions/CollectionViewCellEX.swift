//
//  CollectionViewCellEX.swift
//  Q_managment
//
//  Created by Ahmed on 6/28/21.
//

import Foundation
import UIKit
extension UICollectionViewCell{
    
    /// set animation to cell that slide horizontali
    /// - Parameters:
    ///   - translationX: the initiate transform point is the width of the tableView
    ///   - row: the index of the cell
    func slideAnimation(translationX: CGFloat, item: Int){
        let value = translationX * (app_lang == "en" ? -1:1)
        self.transform = CGAffineTransform(translationX: value, y: 0)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(item),
            options: [.curveEaseInOut],
            animations: {
                self.transform = CGAffineTransform(translationX: 0, y: 0)
            })
    }
    
    
    /// fade animation for the cell
    /// - Parameter row: the index of cell
    func fadeAnimation(item: Int){
        self.alpha = 0

        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(item),
            animations: {
                self.alpha = 1
        })
    }
}
