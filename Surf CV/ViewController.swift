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
        // Do any additional setup after loading the view.
//        selfieView.layer.cornerRadius = selfieView.frame.size.width / 2
//        setupCell()
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataCell.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = skillCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! skillCell
    cell.skillName.text = dataCell[indexPath.row].skillName
    
    
    return cell
}
    
    func setupCell() {
        skillCollectionView.delegate = self
        skillCollectionView.dataSource = self
        skillCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
}

