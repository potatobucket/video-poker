extends Node2D

@onready var cardPos = $cardPos
@onready var cardPosReset = $cardPosReset
@onready var drawButton = $drawButton
@onready var drawLabel = $drawButton/drawOrDrawAgain
@onready var cardShuffle = $cardShuffle
@onready var cardDeal = $cardDeal
@onready var winSong = $winSong
@onready var cardThing = preload("res://Scenes/card.tscn")
@onready var cardCopy = cardThing.instantiate()
@onready var screenWidth = get_viewport_rect().size.y
@onready var screenHeight = get_viewport_rect().size.x

enum phase {
	start,
	draw_one,
	draw_two,
	game_finished
}

signal first_hand_drawn

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
var firstCard = -5
var lastCard = 0
var fiveHundredUnitsOffscreen

#-- initializes the scene
#-- "fiveHundredUnitsOffscreen" is part of a hacky way to clear the
#-- screen after 2nd hand is drawn
func _ready():
	fiveHundredUnitsOffscreen = screenHeight + 500
	drawLabel.set_text("Draw")
	randomPitch = randf_range(0.5, 1.5)
	cardShuffle.set_pitch_scale(randomPitch)

#-- sets the random pitch for when the cards are dealt
#-- also keeps track of if the "draw" button signifies
#-- the first or second draw
func _process(_delta):
	randomPitch = randf_range(0.5, 1.5)

#-- handles if the draw is a new hand or the second hand
func draw_hand():
	if deals == 0 && handFinished == false:
		draw_new_hand()
	elif deals == 1 && handFinished == false:
		discard_unheld_cards()
		refill_hand_with_new_cards()
		show_second_hand()
		drawButton.disabled = true
		drawLabel.set_text("Wait...")
		await get_tree().create_timer(2.5).timeout
		drawButton.disabled = false
		drawLabel.set_text("New Hand?")
#		newHand.sort_custom(sort_by_suit_and_then_value)
		handFinished = true
	elif deals == 2 && handFinished == true:
		print("You drew a new hand!")

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
		cardCopy.emit_particles_that_match_the_suit_of_the_card(cardCopy.cardSuit)
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
		cardCopy.emit_particles_that_match_the_suit_of_the_card(cardCopy.cardSuit)
		await get_tree().create_timer(0.5).timeout
	deals += 1

#-- draws the first hand of cards
func draw_new_hand():
	drawButton.disabled = true
	drawLabel.set_text("Wait...")
	for c in range(0, maxHandSize):
		newHand.append(deck.deck[0])
		deck.deck.pop_front()
	cardShuffle.set_pitch_scale(randomPitch)
	cardShuffle.play()
	discardPile = newHand.duplicate()
	deals += 1

#-- I finally managed to make this a "for" loop, suckers!
func discard_unheld_cards():
	for bling in range(firstCard, lastCard):
		get_child(bling).position.x = fiveHundredUnitsOffscreen
		if get_child(bling).held == true:
			get_child(bling).holdLabel.hide()
			tempHand.append(get_child(bling))
	newHand.clear()
	newHand = tempHand

#-- "debug" stands for when this button was used to figure
#-- things out and then I changed it to "drawButton" and I'm
#-- too lazy to change this part
func _on_debug_pressed():
	draw_hand()
#	newHand.sort_custom(sort_by_suit_and_then_value)

#-- waits until the shuffle sound is over to display the initial hand of cards
func _on_card_shuffle_finished():
	show_hand()
	await get_tree().create_timer(2.5).timeout
	emit_signal("first_hand_drawn")

#-- after the unheld cards are discarded this function refills the
#-- player's hand with new cards back up to five
func refill_hand_with_new_cards():
#	newHand.sort_custom(sort_by_suit_and_then_value)
	if deals == 1 and handFinished == false:
		for c in range(0, maxHandSize - newHand.size()):
			newHand.append(deck.deck[0])
			deck.deck.pop_front()
		handFinished = true
		cardPos = cardPosReset.position

#-- this seems to cause a bug where cards (usually K or Q) get duplicated
#-- I may try and fix it but I don't think it's important enough to spend
#-- time on right now
func sort_by_suit_and_then_value(a, b):
	if a.cardSuit == b.cardSuit:
		if values[a.cardValue] < values[b.cardValue]:
			return true
	elif values[a.cardValue] > values[b.cardValue]:
		return true
	return false

#-- superstitiously held for superstitious reasons
func _on_clear_button_pressed():
	pass

func _on_first_hand_drawn():
	drawButton.disabled = false
	drawLabel.set_text("Draw\nAgain")
