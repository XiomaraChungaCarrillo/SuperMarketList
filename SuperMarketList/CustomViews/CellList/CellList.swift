//
//  CellList.swift
//  SuperMarketList
//
//  Created by Xio iOS on 9/09/22.
//

import UIKit

class CellList: UITableViewCell {
    
    // MARK: - Items User
    @IBOutlet private weak var titleList: UILabel!
    @IBOutlet private weak var descriptionList: UILabel!
    
    // MARK: - Item Button
    @IBOutlet weak var cardView: CardViewButton!
    
     var color: UIColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 0.5)
     var cornerRadiusButton: CGFloat = 20

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.backgroundColor = color
        cardView.cornerRadiusCardView = cornerRadiusButton
        cardView.shadowColor = .clear
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}


