//
//  ViewController.swift
//  Surf CV
//
//  Created by Nikita Kuznetsov on 01.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var selfieView: UIImageView!
    @IBOutlet weak var skillCollectionView: UICollectionView!
    
    let cellID = "skillCell"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        selfieView.layer.cornerRadius = selfieView.frame.size.width / 2
        
        setupCell()
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataCell.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = skillCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! skillCell
    cell.skillName.text = dataCell[indexPath.row].skillName
    
    
    return cell
}
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderCollectionReusableView
        headerView.titleLabel.text = "My Skills"
            return headerView
        
    }

    
    func setupCell() {
        skillCollectionView.delegate = self
        skillCollectionView.dataSource = self
        skillCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        skillCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
//        let layout = UICollectionViewFlowLayout()
//                layout.sectionHeadersPinToVisibleBounds = true
//        skillCollectionView.collectionViewLayout = layout
    }
    
   @objc func deleteSkill() {
       
    }
}

