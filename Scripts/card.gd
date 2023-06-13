extends Node2D

@onready var cardFaces = $cardFacesAndBacks
@onready var holdLabel = $holdLabel
@onready var holdButton = $holdButton

var spadeAnim = "spade"
var diamondAnim = "diamond"
var clubAnim = "club"
var heartAnim = "heart"
var cardBack = "cardBack"
var half = 0.5
var isHeld = false
var tempHand = []

func _ready():
	isHeld = false
	holdLabel.hide()
	cardFaces.set_animation(cardBack)
	cardFaces.set_frame(3)
	cardFaces.set_scale(Vector2(half, half))

func hold_card():
	if holdLabel.visible != true:
		holdLabel.show()
		isHeld = true
#		print(isHeld)
	else:
		holdLabel.hide()
		isHeld = false
#		print(isHeld)

#func redraw_cards():
#	if isHeld == false:
#		tempHand.append(self)
#		print(tempHand)

func _on_hold_button_pressed():
	hold_card()
