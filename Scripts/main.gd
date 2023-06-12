extends Node2D

@onready var debugButton = $debugButton
@onready var card = preload("res://Scenes/card.tscn")
@onready var cardCopy = card.instantiate()
@onready var cardPos = $cardPos

const carraigeReturn = 910
const cardHeight = 95
const cardWidth = 70
const frameReset = 13

var hand = []

func _ready():
	Deck.create_deck()
	generate_cards()

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

func _on_debug_button_pressed():
	print(str(get_child_count() - 2))
