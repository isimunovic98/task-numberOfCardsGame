//
//  GameResultViewController.swift
//  TaskNumberOfCards
//
//  Created by Ivan Simunovic on 12/10/2020.
//

import UIKit

class GameResultViewController: UIViewController {
    
    //MARK: Properties
    var randomizeRepetitions: Int
    
    let deckAssembledLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = label.font.withSize(13.0)
        return label
    }()
    
    let sucessfullDecksLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(13.0)
        return label
    }()
    
    let cardsContainer: CardsVerticalStackView = {
        let view = CardsVerticalStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
        drawRandomCards()
    }
    
    //MARK: Init
    
    init(repetitions: Int) {
        self.randomizeRepetitions = repetitions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    fileprivate func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(deckAssembledLabel)
        view.addSubview(sucessfullDecksLabel)
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(cardsContainer)
        
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            deckAssembledLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            deckAssembledLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            sucessfullDecksLabel.topAnchor.constraint(equalTo: deckAssembledLabel.bottomAnchor, constant: 5),
            sucessfullDecksLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            scrollView.topAnchor.constraint(equalTo: sucessfullDecksLabel.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cardsContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cardsContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cardsContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            cardsContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            cardsContainer.widthAnchor.constraint(equalTo: view.widthAnchor)

        ])
    }
    
    func drawRandomCards() {
        let game = CardRandomizer(container: cardsContainer)
        let result = game.drawCard(repetitions: randomizeRepetitions)
        
        notifyUserOfResult(deckAssembledAfter: result.deckAssembledAfter, sucesfullyAssembledDecks: result.sucesfullyAssembledDecks)
    }
    
    func notifyUserOfResult(deckAssembledAfter: Int, sucesfullyAssembledDecks: Int) {
        
        if(deckAssembledAfter == 0){
            deckAssembledLabel.text = "Deck wasnt assembled"
            return
        }
        
        var decksAssembledMessage = "The deck of cards was sucesfully \n assembled after the "
        decksAssembledMessage.append(String(deckAssembledAfter))
        let lastNum = deckAssembledAfter % 10
        
        switch lastNum {
        case 1:
            decksAssembledMessage.append("st card")
        case 2:
            decksAssembledMessage.append("nd card")
        case 3:
            decksAssembledMessage.append("rd card")
        default:
            decksAssembledMessage.append("th card")
        }
        
        deckAssembledLabel.text = decksAssembledMessage
        
        let sucesfulDecksMessage: String = String(sucesfullyAssembledDecks) + " sucessful decks of cards"
        sucessfullDecksLabel.text = sucesfulDecksMessage
    }
    
}
