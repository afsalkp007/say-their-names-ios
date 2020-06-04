//
//  PetitionsController.swift
//  Say Their Names
//
//  Created by Franck-Stephane Ndame Mpouli on 30/05/2020.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

/// Controller responsible for showing the petitions
final class PetitionsController: UIViewController, ServiceReferring {
    var service: Service?
    
    private lazy var petitionsView = CustomCollectionView(title: Self.PetitionTitle)
    var petitionsCollectionView : UICollectionView { petitionsView.collectionView }

    let dataSource = PetitionsCollectionViewDataSource()
    
    required init(service: Service) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        self.view = petitionsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.configure(collectionView: petitionsCollectionView)
        
        let longTitle = "Editing the new edition of revolution"
        let shortTitle = "Justice for George Floyd"
        
        let dummyPetitions = [
            MockPetition(title: longTitle, verified: true, hasImage: true),
            MockPetition(title: longTitle, verified: false, hasImage: false),
            MockPetition(title: longTitle, verified: true, hasImage: true),
            MockPetition(title: longTitle, verified: true, hasImage: false),
            MockPetition(title: shortTitle, verified: true, hasImage: true),
            MockPetition(title: shortTitle, verified: true, hasImage: false),
            MockPetition(title: shortTitle, verified: false, hasImage: true),
            MockPetition(title: shortTitle, verified: true, hasImage: false)
        ]
        
        dataSource.set(petitions: dummyPetitions)
        
        petitionsCollectionView.delegate = self
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        petitionsCollectionView.reloadData()
        view.setNeedsLayout()
    }
    
    // MARK:- Constants
    static let PetitionTitle = NSLocalizedString("PETITIONS", comment: "Petitions View Controller Title")
//    static let FilterButtonTitle = NSLocalizedString("Filter", comment: "Petitions View Controller Filter Button Title")
}

// MARK:- UICollectionViewDelegateFlowLayout
extension PetitionsController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        return CGSize(width: petitionsView.maxCellWidth, height: 315)
    }
}

