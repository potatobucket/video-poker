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
var isHeld = false
var tempHand = []
var cardValue
var cardSuit
var cardName = ""

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
		print("The ", cardValue, " of ", cardSuit, " is being held.")
	else:
		holdLabel.hide()
		isHeld = false
		print("The ", cardValue, " of ", cardSuit, " is NOT being held.")

#func redraw_cards():
#	if isHeld == false:
#		tempHand.append(self)
#		print(tempHand)

func _on_hold_button_pressed():
	hold_card()
