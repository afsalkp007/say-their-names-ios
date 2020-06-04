//
//  PetitionCollectionViewCell.swift
//  Say Their Names
//
//  Created by Joseph A. Wardell on 6/3/20.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

protocol PetitionViewModel {
    var title : String { get }
    var description : String { get }
    var image : UIImage { get }
    var isVerified : Bool { get }
}

class PetitionCollectionViewCell: UICollectionViewCell {

    static let PetitionCellIdentifier = "PetitionCell"

        override var isSelected: Bool {
        didSet {
            print(#function)
            print("isSelected:\(isSelected)")
//            backgroundColor = isSelected ? UIColor.STN.black : .clear
//            titleLabel.textColor = isSelected ? UIColor.STN.white : UIColor.STN.black
        }
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//        print(#function)
//        print("selected:\(selected)")
//    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        createLayout()
        
        layer.borderColor = UIColor.systemGray5.cgColor
        layer.borderWidth = 2
        
        // For now, Let's assume that these are always black text on white background
        backgroundColor = .white

    }
    
//    override func updateConstraints() {
//        super.updateConstraints()
//        
//        translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            widthAnchor.constraint(equalToConstant: 330),
//            heightAnchor.constraint(equalToConstant: 312)
//        ])
//    }
    
    private var hasLayedOutSubviews = false
    private func createLayout() {
        guard !hasLayedOutSubviews else { return }
        hasLayedOutSubviews = true

        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: 330),
            contentView.heightAnchor.constraint(equalToConstant: 312)
        ])

    }
        
    func configure(with petitionViewModel: PetitionViewModel) {
        print(#function)
        print("petition:\(petitionViewModel)")
    }


}
