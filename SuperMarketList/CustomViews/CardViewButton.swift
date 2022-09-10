//
//  CardViewButton.swift
//  SuperMarketList
//
//  Created by Xio iOS on 9/09/22.
//

import Foundation
import UIKit

@IBDesignable
class CardViewButton: UIView {
    
    @IBInspectable var cornerRadiusCardView: CGFloat = 25
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 2
    @IBInspectable var shadowColor: UIColor? = #colorLiteral(red: 0.1568627451, green: 0.2, blue: 0.2588235294, alpha: 1)
    @IBInspectable var shadowOpacity: Float = 0.3
    @IBInspectable var shadowRadius: CGFloat = 5
    @IBInspectable var masksToBounds: Bool = false
    
    override func awakeFromNib() {
        super.layoutSubviews()
        autoresizesSubviews = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadiusCardView
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadiusCardView)
        
        layer.masksToBounds = masksToBounds
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        layer.shadowColor = shadowColor?.cgColor
        layer.cornerRadius = cornerRadiusCardView
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
    }
}
