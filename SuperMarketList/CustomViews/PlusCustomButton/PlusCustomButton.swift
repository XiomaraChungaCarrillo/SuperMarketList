//
//  PlusCustomButton.swift
//  SuperMarketList
//
//  Created by Xio iOS on 9/09/22.
//

import Foundation
import UIKit

@IBDesignable
class PlusCustomButton: UIButton {
    
    weak var insideview:UIView?
    
    @IBInspectable var color: UIColor = #colorLiteral(red: 1, green: 0.2529911995, blue: 0.506007731, alpha: 1)
    @IBInspectable var cornerRadiusButton: CGFloat = 20
    
    //Outlets
    @IBOutlet weak var cardView: CardViewButton!
    @IBOutlet weak var plusImage: UIImageView!
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    //MARK: Initialize
    private func initialize(){
        insideview = loadViewFromNib()
        setupUI(view: insideview ?? UIView())
    }
    override func awakeFromNib() {
        
    }
    
    //MARK: UI Methods
    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)),
                        bundle: bundle)
        return nib.instantiate( withOwner: self,
                                options: nil).first as? UIView
    }
    
    private func setupUI(view: UIView?){
        insideview?.frame = self.bounds
        addSubview(insideview ?? UIView())
        clearConstraints()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTheme()
    }
    
    private func clearConstraints(){
        insideview?.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": insideview ?? UIView()]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": insideview ?? UIView()]))
    }
    
    private func setupTheme() {
        self.setTitle(String(), for: .normal)
        setupIsDefaultButtonColorSecondary()
    }
    
    // MARK: ColorSecondary

    func setupIsDefaultButtonColorSecondary() {
        cardView.backgroundColor = color
        cardView.layer.cornerRadius = cornerRadiusButton
        cardView.layer.shadowColor = #colorLiteral(red: 1, green: 0.726852102, blue: 0.8691696667, alpha: 1)
        cardView.layer.borderWidth = 3
        cardView.layer.borderColor = #colorLiteral(red: 0.7847447071, green: 0.2044724811, blue: 0.4049135841, alpha: 1)
    }
    
}
