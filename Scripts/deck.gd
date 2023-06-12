extends Node

const spade = "spade"
const club = "club"
const diamond = "diamond"
const heart = "heart"
const suits = [spade, diamond, club, heart]
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

var deck = []

func create_deck():
	for s in suits:
		for v in values:
			deck.append(str(v + " " + s))

func shuffle_deck():
	Deck.deck.shuffle()
	Deck.deck.shuffle()
	Deck.deck.shuffle()
	Deck.deck.shuffle()
	Deck.deck.shuffle()
	Deck.deck.shuffle()
	Deck.deck.shuffle()
