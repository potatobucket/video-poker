extends Node2D

@onready var cardPos = $cardPos
@onready var debugButton = $debugButton
@onready var cardShuffle = $cardShuffle
@onready var cardDeal = $cardDeal
@onready var card = preload("res://Scenes/card.tscn")
@onready var cardCopy = card.instantiate()
@onready var screenWidth = get_viewport_rect().size.y
@onready var screenHeight = get_viewport_rect().size.x

const carraigeReturn = 910
const cardHeight = 95
const cardWidth = 70
const frameReset = 13
const maxHandSize = 5

var hand = []
var tempHand = []
var randomPitch
var deals = 0
var boolean = [false, true]
var randomBoolean

func _ready():
	Deck.create_deck()
#	print("|".join(Deck.deck))
#	generate_cards()

@warning_ignore("unused_parameter")
func _process(delta):
	randomPitch = randf_range(0.5, 1.5)
	randomBoolean = boolean[randi_range(0, 1)]
#	print(get_child_count())

func generate_cards():
	for i in range (0, 52):
		if i <= 12:
			cardCopy = card.instantiate()
			add_child(cardCopy)
			await get_tree().create_timer(0.01).timeout
			cardCopy.position = cardPos.position
			cardCopy.cardFaces.set_animation("spade")
			cardCopy.cardFaces.set_frame(i)
			cardPos.position.x += cardWidth - cardWidth / 2
		if i > 12 and i <= 25:
			cardCopy = card.instantiate()
			add_child(cardCopy)
			await get_tree().create_timer(0.01).timeout
			cardCopy.position = Vector2(cardPos.position.x - carraigeReturn / 2, cardPos.position.y + cardHeight)
			cardCopy.cardFaces.set_animation("diamond")
			cardCopy.cardFaces.set_frame(i % frameReset)
			cardPos.position.x += cardWidth - cardWidth / 2
		if i > 25 and i <= 38:
			cardCopy = card.instantiate()
			add_child(cardCopy)
			await get_tree().create_timer(0.01).timeout
			cardCopy.position = Vector2(cardPos.position.x - (carraigeReturn * 2) / 2, cardPos.position.y + cardHeight * 2)
			cardCopy.cardFaces.set_animation("club")
			cardCopy.cardFaces.set_frame(i % frameReset)
			cardPos.position.x += cardWidth - cardWidth / 2
		if i > 38 and i <= 52:
			cardCopy = card.instantiate()
			add_child(cardCopy)
			await get_tree().create_timer(0.01).timeout
			cardCopy.position = Vector2(cardPos.position.x - (carraigeReturn * 3) / 2, cardPos.position.y + cardHeight * 3)
			cardCopy.cardFaces.set_animation("heart")
			cardCopy.cardFaces.set_frame(i % frameReset)
			cardPos.position.x += cardWidth - cardWidth / 2
#	print(get_children()[8].isHeld)

func draw_hand():
	if deals == 0:
		cardShuffle.set_pitch_scale(randomPitch)
		cardShuffle.play()
		Deck.shuffle_deck()
		if hand.size() != maxHandSize:
			for topCard in range(0, maxHandSize):
				hand.append(Deck.deck[topCard])
		deals += 1
	elif deals == 1:
#		redraw_cards()
		pass

func show_hand():
	for handCard in hand:
		cardCopy = card.instantiate()
		add_child(cardCopy)
		cardCopy.isHeld = false
		cardDeal.set_pitch_scale(randomPitch)
		cardDeal.play()
		cardCopy.cardValue = handCard[0]
		cardCopy.cardSuit = handCard[1]
		cardCopy.position = cardPos.position
		cardCopy.cardFaces.set_animation(cardCopy.cardSuit)
		cardCopy.cardFaces.set_frame(Deck.values[cardCopy.cardValue] - 1)
		cardPos.position.x += get_viewport_rect().size.y / 5
		await get_tree().create_timer(0.5).timeout

#func redraw_cards():
#	for cardInHand in hand:
#		if cardInHand.isHeld == true:
#			print(cardInHand)
#	for checkedCard in hand:
#		if cardCopy.isHeld == false:
#			tempHand.append(checkedCard)
#		print(tempHand)

func _on_debug_button_pressed():
	draw_hand()

func _on_card_shuffle_finished():
	show_hand()
