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

func _ready():
	objectDeck = deck.deck
	draw_hand()
#	print(objectDeck)

func draw_hand():
	for c in range(0, maxHandSize):
		hand.append(deck.deck[c])
#		print(hand[c].cardName)
#		print(handCard.cardValue, " ", handCard.cardSuit, " ", objectDeck.size())
#		await get_tree().create_timer(0.5).timeout
