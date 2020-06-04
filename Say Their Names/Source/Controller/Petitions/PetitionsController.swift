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
    
    private lazy var petitionsView = CustomCollectionView(title: Self.PetitionTitle, filterButtonTitle: Self.FilterButtonTitle)
    var petitionsCollectionView : UICollectionView { petitionsView.collectionView }
    var searchButton : UIButton { petitionsView.searchButton }

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
    }
    
    // MARK:- Constants
    static let PetitionTitle = NSLocalizedString("PETITIONS", comment: "Petitions View Controller Title")
    static let FilterButtonTitle = NSLocalizedString("Filter", comment: "Petitions View Controller Filter Button Title")
}
