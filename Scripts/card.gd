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
	cardFaces.set_animation(cardBack)
	cardFaces.set_frame(3)
	cardFaces.set_scale(Vector2(half, half))

func _process(_delta):
	detect_held_status()
	pass

func hold_card():
	if holdLabel.visible != true:
		holdLabel.show()
	else:
		holdLabel.hide()

func detect_held_status():
	if held == false:
		tempHand.append(self)
	pass

func _on_hold_button_pressed():
	if held == false:
		held = true
	elif held == true:
		held = false
	hold_card()

func _on_hold_label_visibility_changed():
	pass
