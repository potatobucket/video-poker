extends Node2D
class_name Hand

const maxHandSize = 5

var card1
var card2
var card3
var card4
var card5
var isHeld = false
var objectDeck = []
var hand = []
var deck = TestDeck

#-- should probably be deleted but, y'know, superstition
func _ready():
	objectDeck = deck.deck
	draw_hand()

#-- should probably be deleted but, y'know, superstition
func draw_hand():
	for c in range(0, maxHandSize):
		hand.append(deck.deck[c])
