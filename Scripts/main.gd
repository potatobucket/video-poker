extends Node2D

@onready var cardPos = $cardPos
@onready var debugButton = $debugButton
@onready var cardShuffle = $cardShuffle
@onready var card = preload("res://Scenes/card.tscn")
@onready var cardCopy = card.instantiate()

const carraigeReturn = 910
const cardHeight = 95
const cardWidth = 70
const frameReset = 13
const maxHandSize = 5

var hand = []
var randomPitch

func _ready():
	Deck.create_deck()
#	generate_cards()

@warning_ignore("unused_parameter")
func _process(delta):
	randomPitch = randf_range(0.5, 1.5)

func generate_cards():
	for i in range (0, 52):
		if i <= 12:
			cardCopy = card.instantiate()
			add_child(cardCopy)
			cardCopy.position = cardPos.position
			cardCopy.cardFaces.set_animation("spade")
			cardCopy.cardFaces.set_frame(i)
			cardPos.position.x += cardWidth
		if i > 12 and i <= 25:
			cardCopy = card.instantiate()
			add_child(cardCopy)
			cardCopy.position = Vector2(cardPos.position.x - carraigeReturn, cardPos.position.y + cardHeight)
			cardCopy.cardFaces.set_animation("diamond")
			cardCopy.cardFaces.set_frame(i % frameReset)
			cardPos.position.x += cardWidth
		if i > 25 and i <= 38:
			cardCopy = card.instantiate()
			add_child(cardCopy)
			cardCopy.position = Vector2(cardPos.position.x - (carraigeReturn * 2), cardPos.position.y + cardHeight * 2)
			cardCopy.cardFaces.set_animation("club")
			cardCopy.cardFaces.set_frame(i % frameReset)
			cardPos.position.x += cardWidth
		if i > 38 and i <= 52:
			cardCopy = card.instantiate()
			add_child(cardCopy)
			cardCopy.position = Vector2(cardPos.position.x - (carraigeReturn * 3), cardPos.position.y + cardHeight * 3)
			cardCopy.cardFaces.set_animation("heart")
			cardCopy.cardFaces.set_frame(i % frameReset)
			cardPos.position.x += cardWidth

func draw_hand():
	cardShuffle.set_pitch_scale(randomPitch)
	cardShuffle.play()
	Deck.shuffle_deck()
	if hand.size() != maxHandSize:
		for topCard in range(0, maxHandSize):
			hand.append(Deck.deck[topCard])
	pass

func show_hand():
	for handCard in hand:
		cardCopy = card.instantiate()
		add_child(cardCopy)
		var cardValue = handCard[0]
		var cardSuit = handCard[1]
		cardCopy.position = cardPos.position
		cardCopy.cardFaces.set_animation(cardSuit)
		cardCopy.cardFaces.set_frame(Deck.values[cardValue] - 1)
		cardPos.position.x += cardWidth
		print(cardValue + " " + cardSuit)
	pass

func _on_debug_button_pressed():
	draw_hand()
	show_hand()
	pass
