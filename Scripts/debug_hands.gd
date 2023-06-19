extends Node2D

#-- this script lets me me generate rarer hands (like royal flush or straight
#-- flush or what have you) instead of having to rely on random chance

@onready var card = Card
@onready var deck = Deck

var debugHandRoyalFlush = []
var debugHandStraightFlush = []
var debugHandFourOfAKind = []
var debugHandFullHouse = []
var debugHandPeasantFlush = []
var debugHandRegularStraight = []
var debugHandThreeOfAKind = []
var debugHandTwoPair = []

func _ready():
	deck.create_deck()
#	generate_royal_flush()
#	generate_straight_flush()
#	generate_four_of_a_kind()
#	generate_full_house()
#	generate_peasant_flush()
#	generate_straight()
#	generate_three_of_a_kind()
#	generate_two_pair()

func generate_royal_flush():
	debugHandRoyalFlush.append(deck.deck[0])
	debugHandRoyalFlush.append(deck.deck[9])
	debugHandRoyalFlush.append(deck.deck[10])
	debugHandRoyalFlush.append(deck.deck[11])
	debugHandRoyalFlush.append(deck.deck[12])
	for a in debugHandRoyalFlush.size():
		print(debugHandRoyalFlush[a])

func generate_straight_flush():
	debugHandStraightFlush.append(deck.deck[15])
	debugHandStraightFlush.append(deck.deck[16])
	debugHandStraightFlush.append(deck.deck[17])
	debugHandStraightFlush.append(deck.deck[18])
	debugHandStraightFlush.append(deck.deck[19])
	for b in debugHandStraightFlush.size():
		print(debugHandStraightFlush[b])

func generate_four_of_a_kind():
	debugHandFourOfAKind.append(deck.deck[7])
	debugHandFourOfAKind.append(deck.deck[20])
	debugHandFourOfAKind.append(deck.deck[33])
	debugHandFourOfAKind.append(deck.deck[46])
	debugHandFourOfAKind.append(deck.deck[39])
	for c in debugHandStraightFlush.size():
		print(debugHandStraightFlush[c])

func generate_full_house():
	debugHandFullHouse.append(deck.deck[0])
	debugHandFullHouse.append(deck.deck[13])
	debugHandFullHouse.append(deck.deck[26])
	debugHandFullHouse.append(deck.deck[12])
	debugHandFullHouse.append(deck.deck[25])
	for d in debugHandFullHouse.size():
		print(debugHandFullHouse[d])

func generate_peasant_flush():
	debugHandPeasantFlush.append(deck.deck[9])
	debugHandPeasantFlush.append(deck.deck[4])
	debugHandPeasantFlush.append(deck.deck[8])
	debugHandPeasantFlush.append(deck.deck[7])
	debugHandPeasantFlush.append(deck.deck[11])
	for e in debugHandPeasantFlush.size():
		print(debugHandPeasantFlush[e])

func generate_straight():
	debugHandRegularStraight.append(deck.deck[1])
	debugHandRegularStraight.append(deck.deck[15])
	debugHandRegularStraight.append(deck.deck[29])
	debugHandRegularStraight.append(deck.deck[43])
	debugHandRegularStraight.append(deck.deck[44])
	for f in debugHandRegularStraight.size():
		print(debugHandRegularStraight[f])

func generate_three_of_a_kind():
	debugHandThreeOfAKind.append(deck.deck[0])
	debugHandThreeOfAKind.append(deck.deck[13])
	debugHandThreeOfAKind.append(deck.deck[26])
	debugHandThreeOfAKind.append(deck.deck[43])
	debugHandThreeOfAKind.append(deck.deck[44])
	for g in debugHandThreeOfAKind.size():
		print(debugHandThreeOfAKind[g])

func generate_two_pair():
	debugHandTwoPair.append(deck.deck[3])
	debugHandTwoPair.append(deck.deck[16])
	debugHandTwoPair.append(deck.deck[34])
	debugHandTwoPair.append(deck.deck[47])
	debugHandTwoPair.append(deck.deck[5])
	for h in debugHandTwoPair.size():
		print(debugHandTwoPair[h])
