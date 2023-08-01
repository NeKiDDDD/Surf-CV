//
//  HeaderCollectionReusableView.swift
//  Surf CV
//
//  Created by Nikita Kuznetsov on 01.08.2023.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    func setup(with delegate: AnyObject) {
        addButton.addTarget(delegate, action: #selector(addButtonTapped), for: .touchUpInside)
        
    }
    
   @objc func addButtonTapped() {
    }
}
