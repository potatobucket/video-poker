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

#-- initializes the card to be face-down (nominally in case something
#-- goes wrong during set-up)
func _ready():
	cardFaces.set_animation(cardBack)
	cardFaces.set_frame(3)
	cardFaces.set_scale(Vector2(half, half))

func _process(_delta):
	detect_held_status()
	pass

#-- handles whether or not the card says "HOLD" if it is being held
func hold_card():
	if holdLabel.visible != true:
		holdLabel.show()
	else:
		holdLabel.hide()

#-- I don't actually think I need this but I'm afraid if I delete it
#-- something will break
func detect_held_status():
	if held == false:
		tempHand.append(self)
	pass

#-- sets whether or not a card is held when you click it
func _on_hold_button_pressed():
	if held == false:
		held = true
	elif held == true:
		held = false
	hold_card()

#-- once again probably unneeded but I superstitiously refuse to delete it
func _on_hold_label_visibility_changed():
	pass
