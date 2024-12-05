//
//  Secrets.swift
//  WarCardGame
//
//  Created by Duffett, Eric on 12/3/21.
//

import UIKit

//TODO: Create deck of cards as array
/*
let deckOfCards = [
    "2C", "2D", "2H", "2S",
    "3C", "3D", "3H", "3S",
    "4C", "4D", "4H", "4S",
    "5C", "5D", "5H", "5S",
    "6C", "6D", "6H", "6S",
    "7C", "7D", "7H", "7S",
    "8C", "8D", "8H", "8S",
    "9C", "9D", "9H", "9S",
    "TC", "TD", "TH", "TS",
    "JC", "JD", "JH", "JS",
    "QC", "QD", "QH", "QS",
    "KC", "KD", "KH", "KS",
    "AC", "AD", "AH", "AS",
]
*/

//TODO: Draw Cards
/*
let playerCardRandomInt = Int.random(in: 0..<deckOfCards.count)
let playerCard = deckOfCards[playerCardRandomInt]
playerCardImageView.image = UIImage(named: playerCard)

let opponentCardRandomInt = Int.random(in: 0..<deckOfCards.count)
let opponentCard = deckOfCards[opponentCardRandomInt]
opponentCardImageView.image = UIImage(named: opponentCard)
*/


//TODO: Determine Winner
/*
let winner = determineWinner(playerCard: playerCard, opponentCard: opponentCard)
*/


//TODO: Create function that compares cards and determines the winner
/*
func determineWinner(playerCard:String, opponentCard: String) -> String {
    
    var winner = ""
    
    let playerRank = String(playerCard[playerCard.startIndex])
    let opponentRank = String(opponentCard.prefix(1))
    
    let playerValue = getValue(card: playerRank)
    let opponentValue = getValue(card: opponentRank)
    
    if playerValue == opponentValue {
        winner = "tie"
    } else if playerValue > opponentValue {
        winner = "player"
        playerPoints += 1
    } else {
        winner = "opponent"
        opponentPoints += 1
    }
    
    return winner
}
 
 */

//TODO: Create function to convert card rank as String to card value as Int
/*
func getValue(card: String) -> Int {
    switch card {
    case "2", "3", "4", "5", "6", "7", "8", "9":
        return Int(card)!
    case "T":
        return 10
    case "J":
        return 11
    case "Q":
        return 12
    case "K":
        return 13
    case "A":
        return 14
    default:
        return 2
    }
}
 */


//TODO: Display winner with delay
/*
DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
    let alert = UIAlertController(title: "\(winner) wins!", message: "Play again!", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        //TODO: Update points, reset, and play again.
        self.playerPointsLabel.text = "\(self.playerPoints)"
        self.opponentPointsLabel.text = "\(self.opponentPoints)"
        self.playerCardImageView.image = UIImage(named: "cardback")
        self.opponentCardImageView.image = UIImage(named: "cardback")
    }))
    self.present(alert, animated: true, completion: nil)
    
}
 */
