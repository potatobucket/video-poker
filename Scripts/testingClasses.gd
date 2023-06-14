extends Node2D

@onready var testDeck = TestDeck

var card1
var card2
var card3
var card4
var card5
var isHeld = false
var objectDeck = []
var hand = [
	card1,
	card2,
	card3,
	card4,
	card5
]

func _ready():
	objectDeck = testDeck.deck
	show_hand()
#	print(objectDeck)

func show_hand():
	for handCard in hand:
		handCard = objectDeck[0]
		objectDeck.pop_front()
		print(handCard.cardValue, " ", handCard.cardSuit)
		await get_tree().create_timer(0.5).timeout
