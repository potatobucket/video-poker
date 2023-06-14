extends Node2D

@onready var cardPos = $cardPos
@onready var debugButton = $debug
@onready var screenWidth = get_viewport_rect().size.y
@onready var screenHeight = get_viewport_rect().size.x

const carraigeReturn = 910
const cardHeight = 95
const cardWidth = 70
const frameReset = 13
const maxHandSize = 5

var card = Card
var hand
var deck = TestDeck
var test = classTest
var indexOfCardPrinted = 0
var card1
var card2
var card3
var card4
var card5
var newHand = []

func _ready():
	pass

func draw_hand():
	
	for c in range(0, maxHandSize):
		newHand.append(deck.deck[0])
		deck.deck.pop_front()
		print(newHand[c].cardName)
	pass

func print_a_lot_of_things():
#	for i in deck.deck.size():
#		print(deck.deck[i].cardName)
#	for i in newHand:
#		print(i)
	pass

func _on_debug_pressed():
	draw_hand()
	print_a_lot_of_things()
