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
	generate_royal_flush()
	generate_straight_flush()
	generate_four_of_a_kind()
	generate_full_house()
	generate_peasant_flush()
	generate_straight()
	generate_three_of_a_kind()
	generate_two_pair()
	print(debugHandRoyalFlush)
	print(debugHandStraightFlush)
	print(debugHandFourOfAKind)
	print(debugHandFullHouse)
	print(debugHandPeasantFlush)
	print(debugHandRegularStraight)
	print(debugHandThreeOfAKind)
	print(debugHandTwoPair)
	pass

func generate_royal_flush():
	debugHandRoyalFlush.append(deck.deck[0])
	debugHandRoyalFlush.append(deck.deck[9])
	debugHandRoyalFlush.append(deck.deck[10])
	debugHandRoyalFlush.append(deck.deck[11])
	debugHandRoyalFlush.append(deck.deck[12])
#	debugHandRoyalFlush.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandRoyalFlush.sort_custom(debug_sort_by_value_and_then_suit)
#	for a in debugHandRoyalFlush.size():
#		print(debugHandRoyalFlush[a])

func generate_straight_flush():
	debugHandStraightFlush.append(deck.deck[15])
	debugHandStraightFlush.append(deck.deck[16])
	debugHandStraightFlush.append(deck.deck[17])
	debugHandStraightFlush.append(deck.deck[18])
	debugHandStraightFlush.append(deck.deck[19])
#	debugHandStraightFlush.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandStraightFlush.sort_custom(debug_sort_by_value_and_then_suit)
#	for b in debugHandStraightFlush.size():
#		print(debugHandStraightFlush[b])

func generate_four_of_a_kind():
	debugHandFourOfAKind.append(deck.deck[7])
	debugHandFourOfAKind.append(deck.deck[20])
	debugHandFourOfAKind.append(deck.deck[33])
	debugHandFourOfAKind.append(deck.deck[46])
	debugHandFourOfAKind.append(deck.deck[39])
#	debugHandFourOfAKind.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandFourOfAKind.sort_custom(debug_sort_by_value_and_then_suit)
#	for c in debugHandStraightFlush.size():
#		print(debugHandStraightFlush[c])

func generate_full_house():
	debugHandFullHouse.append(deck.deck[0])
	debugHandFullHouse.append(deck.deck[13])
	debugHandFullHouse.append(deck.deck[26])
	debugHandFullHouse.append(deck.deck[12])
	debugHandFullHouse.append(deck.deck[25])
#	debugHandFullHouse.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandFullHouse.sort_custom(debug_sort_by_value_and_then_suit)
#	for d in debugHandFullHouse.size():
#		print(debugHandFullHouse[d])

func generate_peasant_flush():
	debugHandPeasantFlush.append(deck.deck[9])
	debugHandPeasantFlush.append(deck.deck[4])
	debugHandPeasantFlush.append(deck.deck[8])
	debugHandPeasantFlush.append(deck.deck[7])
	debugHandPeasantFlush.append(deck.deck[11])
#	debugHandPeasantFlush.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandPeasantFlush.sort_custom(debug_sort_by_value_and_then_suit)
#	for e in debugHandPeasantFlush.size():
#		print(debugHandPeasantFlush[e])

func generate_straight():
	debugHandRegularStraight.append(deck.deck[1])
	debugHandRegularStraight.append(deck.deck[15])
	debugHandRegularStraight.append(deck.deck[29])
	debugHandRegularStraight.append(deck.deck[43])
	debugHandRegularStraight.append(deck.deck[44])
#	debugHandRegularStraight.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandRegularStraight.sort_custom(debug_sort_by_value_and_then_suit)
#	for f in debugHandRegularStraight.size():
#		print(debugHandRegularStraight[f])

func generate_three_of_a_kind():
	debugHandThreeOfAKind.append(deck.deck[0])
	debugHandThreeOfAKind.append(deck.deck[13])
	debugHandThreeOfAKind.append(deck.deck[26])
	debugHandThreeOfAKind.append(deck.deck[43])
	debugHandThreeOfAKind.append(deck.deck[44])
#	debugHandThreeOfAKind.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandThreeOfAKind.sort_custom(debug_sort_by_value_and_then_suit)
#	for g in debugHandThreeOfAKind.size():
#		print(debugHandThreeOfAKind[g])

func generate_two_pair():
	debugHandTwoPair.append(deck.deck[3])
	debugHandTwoPair.append(deck.deck[16])
	debugHandTwoPair.append(deck.deck[34])
	debugHandTwoPair.append(deck.deck[47])
	debugHandTwoPair.append(deck.deck[5])
#	debugHandTwoPair.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandTwoPair.sort_custom(debug_sort_by_value_and_then_suit)
#	for h in debugHandTwoPair.size():
#		print(debugHandTwoPair[h])

func debug_sort_by_suit_and_then_value(a, b):
	if a[1] == b[1]:
		if deck.values[a[0]] < deck.values[b[0]]:
			return true
	elif deck.values[a[0]] > deck.values[b[0]]:
		return true
	return false

func debug_sort_by_value_and_then_suit(a, b):
	if deck.values[a[0]] == deck.values[b[0]]:
		if a[1] < b[1]:
			return true
	elif a[1] > b[1]:
		return true
	return false
