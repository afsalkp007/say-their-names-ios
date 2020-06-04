//
//  PetitionsCollectionViewDataSource.swift
//  Say Their Names
//
//  Created by Joseph A. Wardell on 6/3/20.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

final class PetitionsCollectionViewDataSource : NSObject {
    
    func configure(collectionView:UICollectionView) {
        collectionView.register(PetitionCollectionViewCell.self, forCellWithReuseIdentifier: PetitionCollectionViewCell.PetitionCellIdentifier)
        collectionView.dataSource = self
    }
}

// MARK:- UICollectionViewDataSource
extension PetitionsCollectionViewDataSource : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        print(#function)
        print("indexPath.row:\(indexPath.item)")
        
//        let location = locations[indexPath.item]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetitionCollectionViewCell.PetitionCellIdentifier, for: indexPath) as? PetitionCollectionViewCell {
//            cell.configure(with: location)
//            locationCell.accessibilityIdentifier = "locationCell\(indexPath.item)"
//            locationCell.isAccessibilityElement = true
            return cell
        }
        
        return UICollectionViewCell()
    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: PetitionTableViewCell.PetitionIdentifier, for: indexPath)
////        cell.textLabel?.text = "Hello"
//        return cell
//    }
}

