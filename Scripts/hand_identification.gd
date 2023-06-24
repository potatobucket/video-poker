extends Node
class_name HandDetection

#-- this script is in charge of identifying whether or not a hand
#-- is a valid winning hand or not

@onready var playerData = PlayerData
@onready var deck = Deck
@onready var signals = Signals

var payout = 0

func baby_sort(a, b):
	if deck.values[a] < deck.values[b]:
		return true
	return false

func detect_royal_flush(hand):
	var validHand = ["ace", "ten", "jack", "queen", "king"]
	var validValues = []
	var validSuits
	for k in hand:
		if k.cardValue == "ace":
			validValues.append("ace")
		elif k.cardValue == "ten":
			validValues.append("ten")
		elif k.cardValue == "jack":
			validValues.append("jack")
		elif k.cardValue == "queen":
			validValues.append("queen")
		elif k.cardValue == "king":
			validValues.append("king")
	if hand[0].cardSuit == hand[1].cardSuit && hand[0].cardSuit == hand[2].cardSuit && hand[0].cardSuit == hand[3].cardSuit && hand[0].cardSuit == hand[4].cardSuit:
		validSuits = true
	else:
		validSuits = false
	validValues.sort_custom(baby_sort)
	if validValues == validHand && validSuits == true:
		var handType = "royal_flush"
		payout = 250
		signals.emit_signal("winning_hand", handType, payout)
		return true

func detect_straight_flush(hand):
	var handValues = []
	var validValues = 0
	var validSuits
	for l in hand:
		handValues.append(l.cardValue)
	if hand[0].cardSuit == hand[1].cardSuit && hand[0].cardSuit == hand[2].cardSuit && hand[0].cardSuit == hand[3].cardSuit && hand[0].cardSuit == hand[4].cardSuit:
		validSuits = true
	handValues.sort_custom(baby_sort)
	if deck.values[handValues[0]] == deck.values[handValues[1]] - 1:
		validValues += 2
	if deck.values[handValues[1]] == deck.values[handValues[2]] - 1:
		validValues += 1
	if deck.values[handValues[2]] == deck.values[handValues[3]] - 1:
		validValues += 1
	if deck.values[handValues[3]] == deck.values[handValues[4]] - 1:
		validValues += 1
	if validValues == 5 && validSuits == true:
		var handType = "straight_flush"
		payout = 100
		signals.emit_signal("winning_hand", handType, payout)
		return true

func detect_four_of_a_kind(hand):
	var handValues = []
	for m in hand:
		handValues.append(m.cardValue)
	handValues.sort_custom(baby_sort)
	if handValues.count(handValues[0]) == 4 || handValues.count(handValues[4]) == 4:
		var handType = "four_of_a_kind"
		payout = 80
		signals.emit_signal("winning_hand", handType, payout)
		return true

func detect_full_house(hand):
	var handValues = []
	var maxValue = 0
	var minValue = 0
	for n in hand:
		handValues.append(n.cardValue)
	maxValue = handValues.max()
	minValue = handValues.min()
	if handValues.count(maxValue) == 3 && handValues.count(minValue) == 2 || handValues.count(maxValue) == 2 && handValues.count(minValue) == 3:
		var handType = "full_house"
		payout = 40
		signals.emit_signal("winning_hand", handType, payout)
		return true

func detect_peasant_flush(hand):
	var handSuits = []
	for o in hand:
		handSuits.append(o.cardSuit)
	if handSuits[0] == handSuits[1] && handSuits[0] == handSuits[2] && handSuits[0] == handSuits[3] && handSuits[0] == handSuits[4]:
		var handType = "flush"
		payout = 20
		signals.emit_signal("winning_hand", handType, payout)
		return true

func detect_regular_straight(hand):
	var handValues = []
	var validValues = 0
	for p in hand:
		handValues.append(p.cardValue)
	handValues.sort_custom(baby_sort)
	if deck.values[handValues[0]] == deck.values[handValues[1]] - 1:
		validValues += 2
	if deck.values[handValues[1]] == deck.values[handValues[2]] - 1:
		validValues += 1
	if deck.values[handValues[2]] == deck.values[handValues[3]] - 1:
		validValues += 1
	if deck.values[handValues[3]] == deck.values[handValues[4]] - 1:
		validValues += 1
	if validValues == 5:
		var handType = "straight"
		payout = 10
		signals.emit_signal("winning_hand", handType, payout)
		return true

func detect_three_of_a_kind(hand):
	var handValues = []
	for q in hand:
		handValues.append(q.cardValue)
	handValues.sort_custom(baby_sort)
	if handValues.count(handValues[0]) == 3 || handValues.count(handValues[1]) == 3 || handValues.count(handValues[2]) == 3:
		var handType = "three_of_a_kind"
		payout = 5
		signals.emit_signal("winning_hand", handType, payout)
		return true

func detect_two_pair(hand):
	var handValues = []
	for q in hand:
		handValues.append(q.cardValue)
	handValues.sort_custom(baby_sort)
	if handValues.count(handValues[0]) == 2 && handValues.count(handValues[2]) == 2:
		var handType = "two_pair"
		payout = 3
		signals.emit_signal("winning_hand", handType, payout)
		return true
	elif handValues.count(handValues[0]) == 2 && handValues.count(handValues[4]) == 2:
		var handType = "two_pair"
		payout = 3
		signals.emit_signal("winning_hand", handType, payout)
		return true
	elif handValues.count(handValues[2]) == 2 && handValues.count(handValues[4]) == 2:
		var handType = "two_pair"
		payout = 3
		signals.emit_signal("winning_hand", handType, payout)
		return true

func detect_jacks_or_better(hand):
	var handValues = []
	for r in hand:
		handValues.append(r.cardValue)
	if handValues.count("jack") == 2 || handValues.count("queen") == 2 || handValues.count("king") == 2 || handValues.count("ace") == 2:
		var handType = "jacks_or_better"
		payout = 2
		signals.emit_signal("winning_hand", handType, payout)
		return true

func detect_all_hands(playerHand):
	detect_royal_flush(playerHand)
	detect_straight_flush(playerHand)
	detect_four_of_a_kind(playerHand)
	detect_full_house(playerHand)
	detect_peasant_flush(playerHand)
	detect_regular_straight(playerHand)
	detect_three_of_a_kind(playerHand)
	detect_two_pair(playerHand)
	detect_jacks_or_better(playerHand)
