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
    var dataCell = [cellData]()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        selfieView.layer.cornerRadius = selfieView.frame.size.width / 2
        
        setupCell()
        dataCell.append(cellData(skillName: "MVP"))
            dataCell.append(cellData(skillName: "GIT"))
            dataCell.append(cellData(skillName: "Swift"))
        dataCell.append(cellData(skillName: "CocoaPods"))
            dataCell.append(cellData(skillName: "SOLID"))
    
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataCell.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = skillCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! skillCell
    cell.skillName.text = dataCell[indexPath.row].skillName
    cell.deleteButtonTapped = {
                self.deleteItemAtIndexPath(indexPath)
            }
    
    
    return cell
}
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderCollectionReusableView
        headerView.setup(with: self)
        headerView.titleLabel.text = "My Skills"
            return headerView
        
    }

    func deleteItemAtIndexPath(_ indexPath: IndexPath) {
        if indexPath.item < dataCell.count {
                dataCell.remove(at: indexPath.item)
                skillCollectionView.deleteItems(at: [indexPath])
            }
        skillCollectionView.reloadData()
        }
    

    
    @objc func addButtonTapped() {
        let alertController = UIAlertController(title: "Добавление навыка", message: nil, preferredStyle: .alert)
        
        alertController.message = "Введите название навыка которым вы владеете"

        alertController.addTextField { textField in
            textField.placeholder = "Введите название"
        }

        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

        alertController.addAction(UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
            if let newSkillName = alertController.textFields?.first?.text, !newSkillName.isEmpty {
                let newSkill = cellData(skillName: newSkillName)
                self?.dataCell.append(newSkill)
                self?.skillCollectionView.reloadData()
            }
        })
        present(alertController, animated: true, completion: nil)
    }


    
    
    func setupCell() {
        skillCollectionView.delegate = self
        skillCollectionView.dataSource = self
        skillCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        skillCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
    }
    
    func addNewSkill(skillName: String) {
        let newSkill = cellData(skillName: skillName)
        dataCell.append(newSkill)
        skillCollectionView.reloadData()
    }
    
}

