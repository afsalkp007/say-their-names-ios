//
//  PetitionsView.swift
//  Say Their Names
//
//  Created by Joseph A. Wardell on 6/3/20.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

/// A UIVIew that contains a UICollectionView <#some more examplanation#>, a Custom Navigation Bar, and 2 buttons: search and filter
class CustomCollectionView: UIView {

    let title : String
//    let filterButtonTitle : String
    
    init(title: String)
    {
        self.title = title
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) { fatalError("This shouldn't happen") }
    
    let customNavigationBar: UIView = {
        let customNavigationBar = UIView()
        customNavigationBar.tintColor = .label
        customNavigationBar.backgroundColor = .black
        return customNavigationBar
    }()
    
//    let searchButton: UIButton = {
//        let searchButton = UIButton(type: .custom)
//        let searchImage = UIImage(named: "Simple Search Icon")?.withRenderingMode(.alwaysTemplate)
//        searchButton.setImage(searchImage, for: .normal)
//        return searchButton
//    }()
//
//    lazy var filterButton: UIButton = {
//        let filterButton = UIButton(type: .custom)
//        filterButton.setTitle(filterButtonTitle, for: .normal)
//        filterButton.setTitleColor(.label, for: .normal)
//        filterButton.titleLabel?.font = UIFont.STN.filledButtonTitle
//        return filterButton
//    }()

//    let separator: UIView! = {
//        let separator = UIView()
//        separator.backgroundColor = .systemGray4
//        return separator
//    }()

//    let tableView : UITableView = {
//        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.separatorStyle = .none
//        tableView.backgroundColor = .systemBackground
//        return tableView
//    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.sectionInsetReference = .fromContentInset
        layout.sectionInset = Self.CollectionViewCellInsets
//        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize //CGSize(width: 4, height: 4) //UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:layout)
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()

    var maxCellWidth : CGFloat {
        collectionView.bounds.width -
            collectionView.safeAreaInsets.left -
            collectionView.safeAreaInsets.right -
            Self.CollectionViewCellInsets.left -
            Self.CollectionViewCellInsets.right
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        createLayout()
        
        backgroundColor = .black
    }

    private var hasLayedOutSubviews = false
    private func createLayout() {
        super.updateConstraints()
        
        guard !hasLayedOutSubviews else { return }
        hasLayedOutSubviews = true
                
        createCustomNavigationBarLayout()
        addSubview(customNavigationBar)
        
        addSubview(collectionView)
        
        // all subviews should use custom constraints
        [customNavigationBar, collectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            customNavigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            customNavigationBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: Self.CustomNavigationBarHeight),
                                    
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func createCustomNavigationBarLayout() {
        
        let label = UILabel()
        label.text = title
        label.font = UIFont.STN.navBarTitle
        label.textColor = .white
                
        let navbarsubviews : [UIView] = [
            label,
//            searchButton,
//            filterButton,
//            separator
        ]
        
        navbarsubviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            customNavigationBar.addSubview($0)
        }
                
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: customNavigationBar.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor),
            
//            filterButton.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor, constant: Self.CustomNavBarMargin),
//            filterButton.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor),
//            filterButton.heightAnchor.constraint(equalToConstant: Self.SearchButtonSize),
//
//            searchButton.widthAnchor.constraint(equalToConstant: Self.SearchButtonSize),
//            searchButton.heightAnchor.constraint(equalToConstant: Self.SearchButtonSize),
//            searchButton.trailingAnchor.constraint(equalTo: customNavigationBar.trailingAnchor, constant: -Self.CustomNavBarMargin),
//            searchButton.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor),
//
//            separator.widthAnchor.constraint(equalToConstant: Self.CustomNavBarUnderbarWidth),
//            separator.heightAnchor.constraint(equalToConstant: Self.CustomNavBarUnderbarHeight),
//            separator.centerXAnchor.constraint(equalTo: customNavigationBar.centerXAnchor),
//            separator.bottomAnchor.constraint(equalTo: customNavigationBar.bottomAnchor)
        ])
    }

    // MARK:- Constants
    static let CustomNavigationBarHeight : CGFloat = 70
    static let SearchButtonSize : CGFloat = 45
    static let CustomNavBarMargin : CGFloat = 16
    static let CustomNavBarUnderbarWidth : CGFloat = 160
    static let CustomNavBarUnderbarHeight : CGFloat = 1
    
    static let CollectionViewCellInsets = UIEdgeInsets(top: 26, left: 26, bottom: 0, right: 26)
}
