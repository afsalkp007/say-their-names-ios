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
    var summary : String { get }
    var image : UIImage? { get }
    var isVerified : Bool { get }
}

class PetitionCollectionViewCell: UICollectionViewCell {

    static let PetitionCellIdentifier = "PetitionCell"

    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var imageViewContainer : UIView = {
        let imageViewContainer = UIView()
        imageViewContainer.clipsToBounds = true
        imageViewContainer.addSubview(imageView)
        imageViewContainer.backgroundColor = .systemGray5
        return imageViewContainer
    }()
    
    lazy var verifiedLabel : UILabel = {
        let label = UILabel()
        label.text = Self.VerifiedText
        label.font = UIFont.STN.verifiedTag
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.STN.bannerTitle
        label.textColor = .black
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    lazy var summaryLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.STN.summary
        label.textColor = .black
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    lazy var findOutMoreButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Self.FindOutMoreButtonTitle.uppercased(), for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = UIFont.STN.sectionHeader
        button.layer.borderWidth = 2
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        createLayout()
        
        layer.borderColor = UIColor.systemGray5.cgColor
        layer.borderWidth = 2
        
        // For now, Let's assume that these are always black text on white background
        backgroundColor = .white

    }
            
    private var allConstriants : [NSLayoutConstraint] = []
    
    override class var requiresConstraintBasedLayout: Bool {
        true
    }
    
    private var hasLayedOutSubviews = false
    func createLayout() {
        
        if !hasLayedOutSubviews {
            
            [imageViewContainer,
             imageView,
             verifiedLabel,
             titleLabel,
             summaryLabel,
             findOutMoreButton].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
            
            imageViewContainer.addSubview(verifiedLabel)
            
            [imageViewContainer,
             titleLabel,
             summaryLabel,
             findOutMoreButton].forEach {
                contentView.addSubview($0)
            }
            hasLayedOutSubviews = true
        }
        
        titleLabel.setContentCompressionResistancePriority(.defaultLow - 1, for: .horizontal)

        NSLayoutConstraint.deactivate(allConstriants)
        
        allConstriants = [
                        
            imageViewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageViewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageViewContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageViewContainer.heightAnchor.constraint(equalToConstant: Self.PetitionImageHeight),

            imageView.centerYAnchor.constraint(equalTo: imageViewContainer.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: imageViewContainer.centerXAnchor),
            imageView.widthAnchor.constraint(greaterThanOrEqualTo: imageViewContainer.widthAnchor),

            verifiedLabel.trailingAnchor.constraint(equalTo: imageViewContainer.trailingAnchor, constant: -Self.VerifiedTextMargin),
            verifiedLabel.topAnchor.constraint(equalTo: imageViewContainer.topAnchor, constant: Self.VerifiedTextMargin),

            titleLabel.topAnchor.constraint(equalTo: imageViewContainer.bottomAnchor, constant: Self.TitleTopMargin),
            titleLabel.leadingAnchor.constraint(equalTo: imageViewContainer.leadingAnchor, constant: Self.TextHorizontalMargin),
            titleLabel.trailingAnchor.constraint(equalTo: imageViewContainer.trailingAnchor, constant: -Self.TextHorizontalMargin),
 
            summaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Self.SummaryTopMargin),
            summaryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: Self.TextHorizontalMargin),
            summaryLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -Self.TextHorizontalMargin),
            
            findOutMoreButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            findOutMoreButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            findOutMoreButton.heightAnchor.constraint(equalToConstant: Self.FindOutMoreButtonHeight),
            
            findOutMoreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Self.FindOutMoreButtonBottomMarging)
        ]
        
        NSLayoutConstraint.activate(allConstriants)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        print(#function)
        
        createLayout()
    }
    

    func configure(with petition: PetitionViewModel) {
        print(#function)
        

        imageView.image = petition.image
        verifiedLabel.isHidden = !petition.isVerified
        titleLabel.text = petition.title
        summaryLabel.text = petition.summary
        
        setNeedsUpdateConstraints()
    }

    // MARK:- Constants
    static let FindOutMoreButtonTitle = NSLocalizedString("Find Out More", comment: "title of Find out more button in PetitionsController")
    static let VerifiedText = NSLocalizedString("verified", comment: "text identifying a petition as verified")
    
    static let PetitionImageHeight : CGFloat = 124
    static let VerifiedTextMargin : CGFloat = 10
    static let TitleTopMargin : CGFloat = 18
    static let TextHorizontalMargin : CGFloat = 15
    static let SummaryTopMargin : CGFloat = 7
    static let ImageTopMargin : CGFloat = 19
    static let ImageContentMargin : CGFloat = 20
    static let FindOutMoreButtonHeight : CGFloat = 50
    static let FindOutMoreButtonBottomMarging : CGFloat = 15
}


/// This is a mock Petition that's meant to be used to demonstrate the layout of PetitionCollectionViewCell
///
/// It uses data from the Figma page
struct MockPetition : PetitionViewModel {
    
    let title: String
    
    var summary: String { "Following the tragic news surrounding the murder of George Floyd by Minneapolis police officers…" }
    
    var image: UIImage? {
        hasImage ? UIImage(named: "Group 6")! : nil
    }
    
    let isVerified: Bool
    let hasImage: Bool
    
    init(title:String, verified:Bool, hasImage:Bool) {
        self.title = title
        self.isVerified = verified
        self.hasImage = hasImage
    }
}
