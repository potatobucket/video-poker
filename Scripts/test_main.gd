extends Node2D

@onready var cardPos = $cardPos
@onready var debugButton = $debug
@onready var cardShuffle = $cardShuffle
@onready var cardDeal = $cardDeal
@onready var cardThing = preload("res://Scenes/card.tscn")
@onready var cardCopy = cardThing.instantiate()
@onready var screenWidth = get_viewport_rect().size.y
@onready var screenHeight = get_viewport_rect().size.x

const carraigeReturn = 910
const cardHeight = 95
const cardWidth = 70
const frameReset = 13
const maxHandSize = 5

var card = Card
var deck = TestDeck
var test = classTest
var randomPitch
var indexOfCardPrinted = 0
var newHand = []
var valueDictionary = {}

func _ready():
	randomPitch = randf_range(0.5, 1.5)
	valueDictionary = deck.values
	pass

func draw_hand():
	for c in range(0, maxHandSize):
		newHand.append(deck.deck[0])
		deck.deck.pop_front()
		print(valueDictionary[newHand[c].cardValue])
	pass

func show_hand():
#	add_child(cardCopy)
	for handCard in newHand:
#		cardThing.instantiate()
		add_child(cardCopy)
		cardDeal.set_pitch_scale(randomPitch)
		cardDeal.play()
#		cardCopy.cardValue = handCard[0]
#		cardCopy.cardSuit = handCard[1]
		cardCopy.position = cardPos.position
		cardCopy.cardFaces.set_animation(handCard.cardSuit)
		cardCopy.cardFaces.set_frame(valueDictionary[handCard.cardValue] - 1)
		cardPos.position.x += get_viewport_rect().size.y / 5
		await get_tree().create_timer(0.5).timeout

func print_a_lot_of_things():
#	for i in deck.deck.size():
#		print(deck.deck[i].cardName)
#	for i in newHand:
#		print(i)
	pass

func _on_debug_pressed():
	draw_hand()
	show_hand()
	print_a_lot_of_things()
