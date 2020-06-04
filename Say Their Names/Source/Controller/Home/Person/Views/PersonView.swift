//
//  PersonView.swift
//  Say Their Names
//
//  Created by Manase on 04/06/2020.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

final class PersonView: UIView {
 
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .red
        view.frame = self.superview!.bounds
        view.contentSize = self.contentViewSize
        view.autoresizingMask = .flexibleHeight
        view.showsHorizontalScrollIndicator = true
        view.bounces = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view 
    }()
    
    lazy var contentViewSize: CGSize = {
        return CGSize(width: self.superview!.bounds.width, height: self.superview!.bounds.height + 400)
    }()
    
    lazy var personCarouselView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.scrollView.bounds.width, height: 530))
        view.backgroundColor = .black
        view.clipsToBounds = true
        return view
    }()
    
    lazy var visualEffectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: effect)
        view.frame = self.personCarouselView.bounds
        return view
    }()
    
    lazy var personImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.clipsToBounds = true
        return view
    }()
    
    lazy var bgPersonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = self.personCarouselView.bounds
        imageView.image = UIImage(named: "man-in-red-jacket-1681010")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = self.personImageContainer.bounds
        imageView.image = UIImage(named: "man-in-red-jacket-1681010")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var actionStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dismissButton, shareButton])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .custom)
        let buttonImage = UIImage(named: "share_white")
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton(type: .custom)
        let buttonImage = UIImage(named: "Close Icon")
        button.setImage(buttonImage, for: .normal)
        return button
    }()

    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        createLayout()
    }
    
    
    private func createLayout() {
        
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        personImageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
                
        personImageContainer.addSubview(personImageView)
        visualEffectView.contentView.addSubview(actionStackView)
        
        visualEffectView.contentView.addSubview(personImageContainer)
        personCarouselView.addSubview(bgPersonImageView)
        personCarouselView.addSubview(visualEffectView)
        
        scrollView.addSubview(personCarouselView)
        addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: 0),
            
            actionStackView.leadingAnchor.constraint(equalTo: visualEffectView.leadingAnchor, constant: 25),
            actionStackView.topAnchor.constraint(equalTo: visualEffectView.topAnchor, constant: 20),
            actionStackView.trailingAnchor.constraint(equalTo: visualEffectView.trailingAnchor, constant: -25),
            actionStackView.heightAnchor.constraint(equalToConstant: 50),
            
            personImageContainer.leadingAnchor.constraint(equalTo: visualEffectView.leadingAnchor, constant: 40),
            personImageContainer.trailingAnchor.constraint(equalTo: visualEffectView.trailingAnchor, constant: -40),
            personImageContainer.topAnchor.constraint(equalTo: actionStackView.bottomAnchor, constant: 20),
            personImageContainer.heightAnchor.constraint(equalToConstant: 380),
            
            personImageView.leadingAnchor.constraint(equalTo: personImageContainer.leadingAnchor, constant: 0),
            personImageView.trailingAnchor.constraint(equalTo: personImageContainer.trailingAnchor, constant: 0),
            personImageView.topAnchor.constraint(equalTo: personImageContainer.topAnchor, constant: 0),
            personImageView.bottomAnchor.constraint(equalTo: personImageContainer.bottomAnchor, constant: 0)
        ])
    }
}
