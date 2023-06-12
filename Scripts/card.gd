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

func _ready():
	holdLabel.hide()
	cardFaces.set_animation(cardBack)
	cardFaces.set_frame(3)
	cardFaces.set_scale(Vector2(half, half))

func _on_hold_button_pressed():
	if holdLabel.visible != true:
		holdLabel.show()
	else:
		holdLabel.hide()
