//
//  CardsStackView.swift
//  TaskNumberOfCards
//
//  Created by Ivan Simunovic on 12/10/2020.
//

import UIKit

class CardsVerticalStackView: UIView {
    
    //MARK: Properties
    var rows = [CardsHorizontalStackView]()
    
    let containerVertical: UIStackView = {
        let stackView = UIStackView()
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.spacing = 6
         stackView.axis = .vertical
         stackView.distribution = .fillEqually
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
        self.addSubview(containerVertical)
        
        setupCards()
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            containerVertical.topAnchor.constraint(equalTo: self.topAnchor),
            containerVertical.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerVertical.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerVertical.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func setupCards() {
        var counter: Int = 0
        
        for _ in 1 ... 9 {
            
            let containerHorizontal: CardsHorizontalStackView = {
                let stackView = CardsHorizontalStackView()
                stackView.translatesAutoresizingMaskIntoConstraints = false
                return stackView
            }()
            
            for _ in 1 ... 6 {
                counter += 1
                
                let cardView: CardView = {
                    let view = CardView()
                    view.translatesAutoresizingMaskIntoConstraints = false
                    return view
                }()
                
                cardView.setImage(image: UIImage(named: String(counter))!)
                
                containerHorizontal.addArrangedSubview(cardView)
    
                containerHorizontal.columns.append(cardView)
                
                if(counter == 52) {
                    containerVertical.addArrangedSubview(containerHorizontal)
                    rows.append(containerHorizontal)
                    return
                }
            }
            containerVertical.addArrangedSubview(containerHorizontal)
            
            rows.append(containerHorizontal)
        }
    }
    
    func incrementCardDrawn(card: Int) {
        var counter = 0
        
        for row in 0 ... 8 {
            
            for column in 0 ... 5 {
                
                counter += 1
                
                if(counter == card) {
                    rows[row].columns[column].incrementCardsDrawn()
                    return
                }
                
            }
        }
    }
}
