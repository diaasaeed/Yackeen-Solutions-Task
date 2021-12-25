//
//  navigationEX.swift
//  Nazan
//
//  Created by apple on 6/21/20.
//  Copyright © 2020 Atiaf. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// Converts this `UIColor` instance to a 1x1 `UIImage` instance and returns it.
    ///
    /// - Returns: `self` as a 1x1 `UIImage`.
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UINavigationBar {

    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}


extension UINavigationController {
    
    //    func setNavigationBarBorderColor(_ color:UIColor) {
    //        self.navigationBar.shadowImage = color.as1ptImage()
    //    }
    
    
    /// set style for navigation bar such as
    /// - shadow color and opacity
    /// - Translucent style
    ///
    /// - Parameters:
    ///   - hidden: detect the navigation bar is hidden or not
    ///   - shadow: detect the navigation bar is have shadow or not
    func set_style(hidden: Bool){
        self.navigationBar.isTranslucent = hidden
        self.setNavigationBarHidden(hidden, animated: true)
    }
    
    
    /// create navigation with ckear Style
    func createClearNaviagtion(){
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIColor.clear.as1ptImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.backgroundColor = .clear
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .heavy) ]
        self.navigationBar.titleTextAttributes = textAttributes
    }
    
    /// create navigation with bg Style
    func createClearNaviagtion(bgColor: UIColor){
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.setBackgroundImage(bgColor.as1ptImage(), for: .default)
        self.navigationBar.shadowImage = bgColor.as1ptImage()
        self.navigationBar.isTranslucent = true
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .heavy) ]
        self.navigationBar.titleTextAttributes = textAttributes
    }
    
    func createNavgationWithBG(bgImage:UIImage){
        self.navigationBar.barTintColor = #colorLiteral(red: 0.06274509804, green: 0.4588235294, blue: 0.7294117647, alpha: 1)
        self.navigationController?.navigationBar.setBackgroundImage(bgImage,for: .default)
        self.navigationBar.isTranslucent = true
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .heavy) ]
        self.navigationBar.titleTextAttributes = textAttributes

    }
    
    /// custom naviagtion bar
    /// - Parameters:
    ///   - backgroundColor: back ground color
    ///   - shadow: shadow object for all shadow properties
    ///   - corners: list of corners that you perform radius in
    func custom(with backgroundColor: UIColor ,shadow: Shadow, corners: UIRectCorner){
        let shadowView = UIView(frame: CGRect(x: 0, y: -50,
                                              width: (self.navigationController?.navigationBar.bounds.width)!,
                                              height: (self.navigationController?.navigationBar.bounds.height)! + 50))
        
        self.navigationController!.navigationBar.shadowImage = UIImage()
        shadowView.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.insertSubview(shadowView, at: 1)
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: shadowView.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        
        shadowLayer.fillColor = backgroundColor.cgColor
        
        shadowLayer.shadowColor = shadow.color.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = shadow.offset
        shadowLayer.shadowOpacity = shadow.opacity
        shadowLayer.shadowRadius = shadow.radius
        
        shadowView.layer.insertSublayer(shadowLayer, at: 0)
        
        self.navigationController?.navigationBar.insertSubview(shadowView, at: 1)
        
    }
    
    /// create a new layer animation for push the VC
    /// - Parameter vc: viewcontroller that we push it
    func customPush(vc: UIViewController){
        self.pushViewController(vc, animated: false)
        self.view.layer.add(pushView.getAnimation(direction: app_lang == "ar" ? .fromLeft:.fromRight), forKey: kCATransition)
    }
    
    /// create a new layer animation for pop to the parent View
    func customPop(){
        self.view.layer.add(pushView.getAnimation(direction: app_lang == "ar" ? .fromRight:.fromLeft), forKey: kCATransition)
        self.popViewController(animated: false)
    }
    
}



//MARK: - navigation bar
extension UINavigationBar{
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
}
