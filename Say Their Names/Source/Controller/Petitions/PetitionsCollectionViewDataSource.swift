//
//  PetitionsCollectionViewDataSource.swift
//  Say Their Names
//
//  Created by Joseph A. Wardell on 6/3/20.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

final class PetitionsCollectionViewDataSource : NSObject {
    
    private(set) var petitions : [PetitionViewModel] = []
    private(set) var collectionView : UICollectionView?
    
    func set(petitions:[PetitionViewModel]) {
        self.petitions = petitions
        collectionView?.reloadData()
    }
    
    func configure(collectionView:UICollectionView) {
        collectionView.register(cellType: PetitionCollectionViewCell.self)
        collectionView.dataSource = self
        
        self.collectionView = collectionView
    }
}

// MARK:- UICollectionViewDataSource
extension PetitionsCollectionViewDataSource : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petitions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        let cell : PetitionCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        cell.configure(with:petitions[indexPath.item])
        return cell
    }

}

