extends Node2D

const spade = "spade"
const club = "club"
const diamond = "diamond"
const heart = "heart"
const suits = [
	spade,
	diamond,
	club,
	heart
]
const values = {
	"ace" : 1,
	"two" : 2,
	"three" : 3,
	"four" : 4,
	"five" : 5,
	"six" : 6,
	"seven" : 7,
	"eight" : 8,
	"nine" : 9,
	"ten" : 10,
	"jack" : 11,
	"queen" : 12,
	"king" : 13,
}

@export var waitTime = 0.01

var deck = []
var shuffleCount = 0
var shufflesExpected = 7
var indexOfCardPrinted = 0

func _ready():
	create_deck()

func create_deck():
	for s in suits:
		for v in values:
			var card = Card.new()
			card.cardSuit = s
			card.cardValue = v
			deck.append(card)

func shuffle_deck():
	for expected in shufflesExpected:
		deck.shuffle()

func _on_texture_button_pressed():
	for card in deck:
		indexOfCardPrinted += 1
		print("No. ", str(indexOfCardPrinted)," ", card)
