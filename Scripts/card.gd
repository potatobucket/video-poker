extends Node2D
class_name Card

@onready var cardFaces = $cardFacesAndBacks
@onready var holdLabel = $holdLabel
@onready var holdButton = $holdButton

var spadeAnim = "spade"
var diamondAnim = "diamond"
var clubAnim = "club"
var heartAnim = "heart"
var cardBack = "cardBack"
var half = 0.5
var held
var tempHand = []
var cardValue
var cardSuit
var cardName = ""

func _ready():
#	isHeld = false
	holdLabel.hide()
	cardFaces.set_animation(cardBack)
	cardFaces.set_frame(3)
	cardFaces.set_scale(Vector2(half, half))

func _process(delta):
	detect_held_status()
#	if holdLabel.hide() == true:
#		isHeld = false
#	elif holdLabel.hide() == false:
#		isHeld = true
	pass
#	if isHeld == false:
#		holdLabel.hide()
#	elif isHeld == true:
#		holdLabel.show()

func hold_card():
	if holdLabel.visible != true:
		holdLabel.show()
		held = true
#		print(isHeld)
	else:
		holdLabel.hide()
		held = false
#		print(isHeld)

func detect_held_status():
	if held == false:
		tempHand.append(self)
	pass

#func redraw_cards():
#	if isHeld == false:
#		tempHand.append(self)
#		print(tempHand)

func _on_hold_button_pressed():
	pass
#	isHeld = true
#	if tempHand.is_empty():
#		tempHand.append(self)
#	print("Totally pressed, man")
#	pass
#	hold_card()

func _on_hold_button_test_pressed():
	hold_card()
