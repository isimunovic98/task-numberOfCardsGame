//
//  RandomizeCards.swift
//  TaskNumberOfCards
//
//  Created by Ivan Simunovic on 12/10/2020.
//

import Foundation

class CardRandomizer{
    let container: CardsVerticalStackView
    var firstDeck = Set<Int>()
    
    init(container: CardsVerticalStackView) {
        self.container = container
    }
    
    func drawCard(repetitions: Int) -> (deckAssembledAfter: Int, sucesfullyAssembledDecks: Int){
        var flag = true
        var lastCardInFirstDeck: Int?
        
        for i in 1...repetitions {
            let num = Int.random(in: 1 ... 52)
            
            //If it is the first card of that type add it to "firstDeck",
            //else add it to otherCards
            firstDeck.insert(num)
            
            if(flag) {
                lastCardInFirstDeck = i
            }
             
            if(firstDeck.count == 52){
                flag = false
            }
            
            container.incrementCardDrawn(card: num)
        }
        var sucesfullyAssembledDecks = container.rows[0].columns[0].cardsDrawn
        for row in 0 ... 8{
            for column in 0 ... 5 {
                if (container.rows[row].columns[column].cardsDrawn < sucesfullyAssembledDecks){
                sucesfullyAssembledDecks = container.rows[row].columns[column].cardsDrawn
                }
                
                if(row == 8 && column == 3) {
                    break
                }
            }
        }
        
        return (lastCardInFirstDeck ?? 0 , sucesfullyAssembledDecks)
    }
}
