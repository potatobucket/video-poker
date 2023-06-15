extends Node2D

@onready var cardPos = $cardPos
@onready var cardPosReset = $cardPosReset
@onready var drawButton = $drawButton
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

#-- initializes the scene
func _ready():
	drawButton.set_text("Draw")
	randomPitch = randf_range(0.5, 1.5)
	cardShuffle.set_pitch_scale(randomPitch)

#-- sets the random pitch for when the cards are dealt
#-- also keeps track of if the "draw" button signifies
#-- the first or second draw
func _process(_delta):
	randomPitch = randf_range(0.5, 1.5)
	if deals == 1:
		drawButton.set_text("Draw again")
	else:
		drawButton.set_text("Draw")

#-- handles if the draw is a new hand or the second hand
func draw_hand():
	if deals == 0 and handFinished == false:
		draw_new_hand()
	elif deals == 1 and handFinished == false:
		discard_unheld_cards()
		refill_hand_with_new_cards()
		show_second_hand()
		handFinished = true

#-- handles showing the initial new hand
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

#-- handles showing the second hand after the player discards and
#-- draws new cards
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

#-- draws the first hand of cards
func draw_new_hand():
	for c in range(0, maxHandSize):
		newHand.append(deck.deck[0])
		deck.deck.pop_front()
	cardShuffle.set_pitch_scale(randomPitch)
	cardShuffle.play()
	discardPile = newHand.duplicate()
	deals += 1

#-- discards the cards that you haven't held
func discard_unheld_cards():
	if get_child(-5).held == true:
		get_child(-5).holdLabel.hide()
		tempHand.append(get_child(-5))
	else:
		get_child(-5).queue_free()
	if get_child(-4).held == true:
		get_child(-4).holdLabel.hide()
		tempHand.append(get_child(-4))
	else:
		get_child(-4).queue_free()
	if get_child(-3).held == true:
		get_child(-3).holdLabel.hide()
		tempHand.append(get_child(-3))
	else:
		get_child(-3).queue_free()
	if get_child(-2).held == true:
		get_child(-2).holdLabel.hide()
		tempHand.append(get_child(-2))
	else:
		get_child(-2).queue_free()
	if get_child(-1).held == true:
		get_child(-1).holdLabel.hide()
		tempHand.append(get_child(-1))
	else:
		get_child(-1).queue_free()
	newHand.clear()
	newHand = tempHand

#-- "debug" stands for when this button was used to figure
#-- things out and then I changed it to "drawButton" and I'm
#-- too lazy to change this part
func _on_debug_pressed():
	draw_hand()

#-- waits until the shuffle sound is over to display the initial hand of cards
func _on_card_shuffle_finished():
	show_hand()

#-- after the unheld cards are discarded this function refills the
#-- player's hand with new cards back up to five
func refill_hand_with_new_cards():
	if deals == 1 and handFinished == false:
		for c in range(0, maxHandSize - newHand.size()):
			newHand.append(deck.deck[0])
			deck.deck.pop_front()
		handFinished = true
		cardPos = cardPosReset.position

#-- superstitiously held for superstitious reasons
func _on_clear_button_pressed():
	pass
