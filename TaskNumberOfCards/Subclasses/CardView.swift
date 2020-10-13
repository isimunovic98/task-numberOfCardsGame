//
//  CardView.swift
//  TaskNumberOfCards
//
//  Created by Ivan Simunovic on 12/10/2020.
//

import UIKit

class CardView: UIView {
    var cardsDrawn: Int = 0
        
    //MARK: Properties
    let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "AceOfSpades")
        return imageView
    }()
    
    let numberOfCardsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.text = "0"
        return label
    }()
    
    let blackBack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    
    fileprivate func setupView() {
        self.addSubview(cardImageView)
        self.addSubview(blackBack)
        self.addSubview(numberOfCardsLabel)
        
        
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            cardImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            cardImageView.widthAnchor.constraint(equalToConstant: 55),
            
            blackBack.centerXAnchor.constraint(equalTo: cardImageView.centerXAnchor),
            blackBack.centerYAnchor.constraint(equalTo: cardImageView.centerYAnchor),
            blackBack.heightAnchor.constraint(equalToConstant: 20),
            blackBack.widthAnchor.constraint(equalToConstant: 20),
            
            numberOfCardsLabel.centerXAnchor.constraint(equalTo: cardImageView.centerXAnchor),
            numberOfCardsLabel.centerYAnchor.constraint(equalTo: cardImageView.centerYAnchor)
        ])
    }
    
    func setImage(image: UIImage) {
        cardImageView.image = image
    }
    
    func incrementCardsDrawn() {
        cardsDrawn += 1
        numberOfCardsLabel.text = String(cardsDrawn)
    }
    
}
