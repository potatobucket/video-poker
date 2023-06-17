extends Node2D
class_name Card

@onready var cardFaces = $cardFacesAndBacks
@onready var holdLabel = $holdLabel
@onready var holdButton = $holdButton
@onready var particleOrigin = $particleMarker
@onready var clubParticle = preload("res://Scenes/clubs_particles.tscn")
@onready var clubCopy = clubParticle.instantiate()
@onready var diamondParticle = preload("res://Scenes/diamonds_particles.tscn")
@onready var diamondCopy = diamondParticle.instantiate()
@onready var heartParticle = preload("res://Scenes/hearts_particles.tscn")
@onready var heartCopy = heartParticle.instantiate()
@onready var spadeParticle = preload("res://Scenes/spades_particles.tscn")
@onready var spadeCopy = spadeParticle.instantiate()

enum suitHolder {
	club,
	diamond,
	heart,
	spade
}

var suitDic = {
	"club" : suitHolder.club,
	"diamond" : suitHolder.diamond,
	"heart" : suitHolder.heart,
	"spade" : suitHolder.spade
}

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

#-- I don't know if, technically speaking, this NEEDED to be a match case
#-- but boy do I feel fancy for having done it
func emit_particles_that_match_the_suit_of_the_card(suit):
	suit = suitDic[suit]
	match (suit):
		suitHolder.club:
			particleOrigin.add_child(clubCopy)
			clubCopy.get_child(0).set_emitting(true)
		suitHolder.diamond:
			particleOrigin.add_child(diamondCopy)
			diamondCopy.get_child(0).set_emitting(true)
		suitHolder.heart:
			particleOrigin.add_child(heartCopy)
			heartCopy.get_child(0).set_emitting(true)
		suitHolder.spade:
			particleOrigin.add_child(spadeCopy)
			spadeCopy.get_child(0).set_emitting(true)

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
