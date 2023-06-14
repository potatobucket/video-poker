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
var randTorF = [true, false]
var randBool
var indexOfCardPrinted = 0
var deals = 0
var newHand = []
var values = deck.values
var discardPile = []
var handFinished = false
var childToRemove = 6

func _ready():
	randomPitch = randf_range(0.5, 1.5)
	cardShuffle.set_pitch_scale(randomPitch)
#	draw_hand()

func _process(delta):
	randomPitch = randf_range(0.5, 1.5)
	randBool = randTorF[randi_range(0, 1)]
	pass

func draw_hand():
#	print(deals)
	if deals == 0 and handFinished == false:
		for c in range(0, maxHandSize):
			newHand.append(deck.deck[0])
			deck.deck.pop_front()
#			print(valueDictionary[newHand[c].cardValue])
		cardShuffle.set_pitch_scale(randomPitch)
		cardShuffle.play()
		discardPile = newHand.duplicate()
		deals += 1
	elif deals == 1 and handFinished == false:
		newHand.clear()
		for c in range(0, maxHandSize):
			newHand.append(deck.deck[0])
			deck.deck.pop_front()
		show_hand()
		print(newHand)
		print(discardPile)
		handFinished = true
#		print(deals, ", ", handFinished)
#		print_a_lot_of_things()
#		for p in range(0, maxHandSize):
#			print(newHand[p].isHeld)
#			if newHand[p].isHeld == false:
#				discardPile.append(newHand[p])
#		print(discardPile)
		pass

func show_hand():
#	add_child(cardCopy)
	for handCard in newHand:
		cardCopy = cardThing.instantiate()
		add_child(cardCopy)
		cardCopy.cardValue = handCard.cardValue
		cardCopy.cardSuit = handCard.cardSuit
#		cardCopy.isHeld = randBool
		cardDeal.set_pitch_scale(randomPitch)
		cardDeal.play()
		cardCopy.position = cardPos.position
		cardCopy.cardFaces.set_animation(handCard.cardSuit)
		cardCopy.cardFaces.set_frame(values[handCard.cardValue] - 1)
		cardPos.position.x += get_viewport_rect().size.y / 5
#		print_a_lot_of_things()
		await get_tree().create_timer(0.5).timeout

func show_second_hand():
#	add_child(cardCopy)
	for handCard in newHand:
		cardCopy = cardThing.instantiate()
		add_child(cardCopy)
		cardCopy.cardValue = handCard.cardValue
		cardCopy.cardSuit = handCard.cardSuit
#		cardCopy.isHeld = randBool
		cardDeal.set_pitch_scale(randomPitch)
		cardDeal.play()
		cardCopy.position = cardPosReset.position
		cardCopy.cardFaces.set_animation(handCard.cardSuit)
		cardCopy.cardFaces.set_frame(values[handCard.cardValue] - 1)
		cardPosReset.position.x += get_viewport_rect().size.y / 5
#		print_a_lot_of_things()
		await get_tree().create_timer(0.5).timeout

#func hold_them_cards():
#	if cardCopy.holdLabel.visible != true:
#		cardCopy.holdLabel.show()
#		cardCopy.isHeld = true
#		print("The ", cardCopy.cardValue, " of ", cardCopy.cardSuit, " is being held.")
#	else:
#		cardCopy.holdLabel.hide()
#		cardCopy.isHeld = false
#		print("The ", cardCopy.cardValue, " of ", cardCopy.cardSuit, " is NOT being held.")
#	pass

func print_a_lot_of_things():
	print(get_child_count())
	pass

func _on_debug_pressed():
#	print_a_lot_of_things()
	draw_hand()
#	cardCopy._on_hold_button_pressed()
#	show_hand()
#	print_a_lot_of_things()

func _on_card_shuffle_finished():
	show_hand()

func _on_clear_button_pressed():
	if deals == 1 and handFinished == false:
		newHand.clear()
		for c in range(0, maxHandSize):
			newHand.append(deck.deck[0])
			deck.deck.pop_front()
		print(newHand)
		print(discardPile)
		handFinished = true
#		if childToRemove < 10:
#			get_child(childToRemove).queue_free()
#			childToRemove += 1
		get_child(6).queue_free()
		get_child(7).queue_free()
		get_child(8).queue_free()
		get_child(9).queue_free()
		get_child(10).queue_free()
		cardPos = cardPosReset.position
	show_second_hand()
