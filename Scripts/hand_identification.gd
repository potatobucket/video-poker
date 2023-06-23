extends Node
class_name HandDetection

#-- this script is in charge of identifying whether or not a hand
#-- is a valid winning hand or not

@onready var deck = Deck

func baby_sort(a, b):
	if deck.values[a] < deck.values[b]:
		return true
	return false

func detect_royal_flush(hand):
	var validHand = ["ace", "ten", "jack", "queen", "king"]
	var validValues = []
	var validSuits
	for k in hand:
		if k.has("ace"):
			validValues.append("ace")
		elif k.has("ten"):
			validValues.append("ten")
		elif k.has("jack"):
			validValues.append("jack")
		elif k.has("queen"):
			validValues.append("queen")
		elif k.has("king"):
			validValues.append("king")
	if hand[0][1] == hand[1][1] && hand[0][1] == hand[2][1] && hand[0][1] == hand[3][1] && hand[0][1] == hand[4][1]:
		validSuits = true
	else:
		validSuits = false
	validValues.sort_custom(baby_sort)
	if validValues == validHand && validSuits == true:
		return true

func detect_straight_flush(hand):
	var handValues = []
	var validValues = 0
	var validSuits
	for l in hand:
		handValues.append(l[0])
	if hand[0][1] == hand[1][1] && hand[0][1] == hand[2][1] && hand[0][1] == hand[3][1] && hand[0][1] == hand[4][1]:
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
		return true

func detect_four_of_a_kind(hand):
	var handValues = []
	for m in hand:
		handValues.append(m[0])
	handValues.sort_custom(baby_sort)
	if handValues.count(handValues[0]) == 4 || handValues.count(handValues[4]) == 4:
		return true

func detect_full_house(hand):
	var handValues = []
	var maxValue = 0
	var minValue = 0
	for n in hand:
		handValues.append(n[0])
	maxValue = handValues.max()
	minValue = handValues.min()
	if handValues.count(maxValue) == 3 && handValues.count(minValue) == 2 || handValues.count(maxValue) == 2 && handValues.count(minValue) == 3:
		return true

func detect_peasant_flush(hand):
	var handSuits = []
	for o in hand:
		handSuits.append(o[1])
	if handSuits[0] == handSuits[1] && handSuits[0] == handSuits[2] && handSuits[0] == handSuits[3] && handSuits[0] == handSuits[4]:
		return true

func detect_regular_straight(hand):
	var handValues = []
	var validValues = 0
	for p in hand:
		handValues.append(p[0])
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
		return true

func detect_three_of_a_kind(hand):
	var handValues = []
	for q in hand:
		handValues.append(q[0])
	handValues.sort_custom(baby_sort)
	if handValues.count(handValues[0]) == 3 || handValues.count(handValues[1]) == 3 || handValues.count(handValues[2]) == 3:
		return true

func detect_two_pair(hand):
	var handValues = []
	for q in hand:
		handValues.append(q[0])
	handValues.sort_custom(baby_sort)
	if handValues.count(handValues[0]) == 2 && handValues.count(handValues[2]) == 2:
		return true
	elif handValues.count(handValues[0]) == 2 && handValues.count(handValues[4]) == 2:
		return true
	elif handValues.count(handValues[2]) == 2 && handValues.count(handValues[4]) == 2:
		return true

func detect_jacks_or_better(hand):
	var handValues = []
	for r in hand:
		handValues.append(r[0])
	if handValues.count("jack") == 2 || handValues.count("queen") == 2 || handValues.count("king") == 2 || handValues.count("ace") == 2:
		return true