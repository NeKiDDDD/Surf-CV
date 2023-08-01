//
//  skillCell.swift
//  Surf CV
//
//  Created by Nikita Kuznetsov on 01.08.2023.
//

import UIKit

class skillCell: UICollectionViewCell {
    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    var deleteButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        grayView.layer.cornerRadius = 20
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        deleteButtonTapped?()
    }
    
}
