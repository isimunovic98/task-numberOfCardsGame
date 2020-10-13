//
//  GambleButtonView.swift
//  TaskNumberOfCards
//
//  Created by Ivan Simunovic on 12/10/2020.
//

import UIKit

class GambleButtonView: UIView {

    //MARK: Properties
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 6
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        return stackView
    }()
    
    let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "22")
        return imageView
    }()
    
    let gambleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GAMBLE"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
        configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Methods
    fileprivate func setupView() {
        self.addSubview(stackView)
        
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = true;
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10),
            
            cardImageView.heightAnchor.constraint(equalToConstant: 15),
            cardImageView.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    fileprivate func configureStackView() {
        stackView.addArrangedSubview(cardImageView)
        stackView.addArrangedSubview(gambleLabel)
    }
    
}
