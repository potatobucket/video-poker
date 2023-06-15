extends Node2D

@onready var cardPos = $cardPos
@onready var cardPosReset = $cardPosReset
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
var deals = 0
var newHand = []
var tempHand = []
var values = deck.values
var discardPile = []
var handFinished = false
var childToRemove = 6

func _ready():
	debugButton.set_text("Draw")
	randomPitch = randf_range(0.5, 1.5)
	cardShuffle.set_pitch_scale(randomPitch)

func _process(delta):
	randomPitch = randf_range(0.5, 1.5)
	if deals == 1:
		debugButton.set_text("Draw again")
	else:
		debugButton.set_text("Draw")

func draw_hand():
	if deals == 0 and handFinished == false:
		draw_new_hand()
	elif deals == 1 and handFinished == false:
		discard_unheld_cards()
		refill_hand_with_new_cards()
		show_second_hand()
		handFinished = true

func show_hand():
	for handCard in newHand:
		cardCopy = cardThing.instantiate()
		add_child(cardCopy)
		cardCopy.cardValue = handCard.cardValue
		cardCopy.cardSuit = handCard.cardSuit
		cardCopy.held = false
		cardDeal.set_pitch_scale(randomPitch)
		cardDeal.play()
		cardCopy.position = cardPos.position
		cardCopy.cardFaces.set_animation(handCard.cardSuit)
		cardCopy.cardFaces.set_frame(values[handCard.cardValue] - 1)
		cardPos.position.x += get_viewport_rect().size.y / 5
		await get_tree().create_timer(0.5).timeout

func show_second_hand():
	for handCard in newHand:
		cardCopy = cardThing.instantiate()
		add_child(cardCopy)
		cardCopy.cardValue = handCard.cardValue
		cardCopy.cardSuit = handCard.cardSuit
		cardDeal.set_pitch_scale(randomPitch)
		cardDeal.play()
		cardCopy.position = cardPosReset.position
		cardCopy.cardFaces.set_animation(handCard.cardSuit)
		cardCopy.cardFaces.set_frame(values[handCard.cardValue] - 1)
		cardPosReset.position.x += get_viewport_rect().size.y / 5
		await get_tree().create_timer(0.5).timeout

func draw_new_hand():
	for c in range(0, maxHandSize):
		newHand.append(deck.deck[0])
		deck.deck.pop_front()
	cardShuffle.set_pitch_scale(randomPitch)
	cardShuffle.play()
	discardPile = newHand.duplicate()
	deals += 1

func discard_unheld_cards():
	if get_child(6).held == true:
		get_child(6).holdLabel.hide()
		tempHand.append(get_child(6))
	else:
		get_child(6).queue_free()
	if get_child(7).held == true:
		get_child(7).holdLabel.hide()
		tempHand.append(get_child(7))
	else:
		get_child(7).queue_free()
	if get_child(8).held == true:
		get_child(8).holdLabel.hide()
		tempHand.append(get_child(8))
	else:
		get_child(8).queue_free()
	if get_child(9).held == true:
		get_child(9).holdLabel.hide()
		tempHand.append(get_child(9))
	else:
		get_child(9).queue_free()
	if get_child(10).held == true:
		get_child(10).holdLabel.hide()
		tempHand.append(get_child(10))
	else:
		get_child(10).queue_free()
	newHand.clear()
	newHand = tempHand

func _on_debug_pressed():
	draw_hand()

func _on_card_shuffle_finished():
	show_hand()

func refill_hand_with_new_cards():
	if deals == 1 and handFinished == false:
		for c in range(0, maxHandSize - newHand.size()):
			newHand.append(deck.deck[0])
			deck.deck.pop_front()
		handFinished = true
		cardPos = cardPosReset.position

func _on_clear_button_pressed():
	pass
