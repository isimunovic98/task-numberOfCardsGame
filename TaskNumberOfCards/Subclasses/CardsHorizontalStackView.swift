//
//  CardsHorizontalStackView.swift
//  TaskNumberOfCards
//
//  Created by Ivan Simunovic on 12/10/2020.
//

import UIKit

class CardsHorizontalStackView: UIView {
    
    //MARK: Properties
    var columns = [CardView]()
    
    let containerHoizontal: UIStackView = {
        let stackView = UIStackView()
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.spacing = 10
         stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
         return stackView
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
        self.addSubview(containerHoizontal)
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            containerHoizontal.topAnchor.constraint(equalTo: self.topAnchor),
            containerHoizontal.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerHoizontal.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerHoizontal.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }
    
    func addArrangedSubview(_ view: UIView) {
        containerHoizontal.addArrangedSubview(view)
    }
}
