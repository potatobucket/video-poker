extends Node2D
class_name DebugMenu

#-- this script lets me me generate rarer hands (like royal flush or straight
#-- flush or what have you) instead of having to rely on random chance

@onready var card = Card
@onready var deck = Deck
@onready var cardThing = preload("res://Scenes/card.tscn")
@onready var cardCopy = cardThing.instantiate()
@onready var handDetection = DetectHands
@onready var cardPos = $cardPos
@onready var handID = $handID
@onready var winSong = $winSong
@onready var loseSong = $loseSong

var debugHandRoyalFlush = []
var debugHandStraightFlush = []
var debugHandFourOfAKind = []
var debugHandFullHouse = []
var debugHandPeasantFlush = []
var debugHandRegularStraight = []
var debugHandThreeOfAKind = []
var debugHandTwoPair = []
var debugHandJacksOrBetter = []

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
#	generate_jacks_or_better()
	generate_losing_hand()
	debug_detect_all_hands()
	if !debug_detect_all_hands():
		debug_detect_losing_hand()

func generate_royal_flush():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRoyalFlush.append(cardCopy)
	cardCopy.cardValue = "ace"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRoyalFlush.append(cardCopy)
	cardCopy.cardValue = "ten"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRoyalFlush.append(cardCopy)
	cardCopy.cardValue = "jack"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRoyalFlush.append(cardCopy)
	cardCopy.cardValue = "queen"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRoyalFlush.append(cardCopy)
	cardCopy.cardValue = "king"
	cardCopy.cardSuit = deck.suits[0]

func generate_straight_flush():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandStraightFlush.append(cardCopy)
	cardCopy.cardValue = "four"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandStraightFlush.append(cardCopy)
	cardCopy.cardValue = "five"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandStraightFlush.append(cardCopy)
	cardCopy.cardValue = "six"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandStraightFlush.append(cardCopy)
	cardCopy.cardValue = "seven"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandStraightFlush.append(cardCopy)
	cardCopy.cardValue = "eight"
	cardCopy.cardSuit = deck.suits[1]

func generate_four_of_a_kind():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFourOfAKind.append(cardCopy)
	cardCopy.cardValue = "eight"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFourOfAKind.append(cardCopy)
	cardCopy.cardValue = "five"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFourOfAKind.append(cardCopy)
	cardCopy.cardValue = "five"
	cardCopy.cardSuit = deck.suits[2]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFourOfAKind.append(cardCopy)
	cardCopy.cardValue = "five"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFourOfAKind.append(cardCopy)
	cardCopy.cardValue = "five"
	cardCopy.cardSuit = deck.suits[0]

func generate_full_house():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFullHouse.append(cardCopy)
	cardCopy.cardValue = "king"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFullHouse.append(cardCopy)
	cardCopy.cardValue = "king"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFullHouse.append(cardCopy)
	cardCopy.cardValue = "king"
	cardCopy.cardSuit = deck.suits[2]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFullHouse.append(cardCopy)
	cardCopy.cardValue = "five"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandFullHouse.append(cardCopy)
	cardCopy.cardValue = "five"
	cardCopy.cardSuit = deck.suits[1]

func generate_peasant_flush():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandPeasantFlush.append(cardCopy)
	cardCopy.cardValue = "eight"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandPeasantFlush.append(cardCopy)
	cardCopy.cardValue = "ace"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandPeasantFlush.append(cardCopy)
	cardCopy.cardValue = "nine"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandPeasantFlush.append(cardCopy)
	cardCopy.cardValue = "seven"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandPeasantFlush.append(cardCopy)
	cardCopy.cardValue = "king"
	cardCopy.cardSuit = deck.suits[3]

func generate_straight():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRegularStraight.append(cardCopy)
	cardCopy.cardValue = "four"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRegularStraight.append(cardCopy)
	cardCopy.cardValue = "five"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRegularStraight.append(cardCopy)
	cardCopy.cardValue = "six"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRegularStraight.append(cardCopy)
	cardCopy.cardValue = "seven"
	cardCopy.cardSuit = deck.suits[2]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandRegularStraight.append(cardCopy)
	cardCopy.cardValue = "eight"
	cardCopy.cardSuit = deck.suits[3]

func generate_three_of_a_kind():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandThreeOfAKind.append(cardCopy)
	cardCopy.cardValue = "three"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandThreeOfAKind.append(cardCopy)
	cardCopy.cardValue = "three"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandThreeOfAKind.append(cardCopy)
	cardCopy.cardValue = "three"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandThreeOfAKind.append(cardCopy)
	cardCopy.cardValue = "seven"
	cardCopy.cardSuit = deck.suits[2]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandThreeOfAKind.append(cardCopy)
	cardCopy.cardValue = "eight"
	cardCopy.cardSuit = deck.suits[3]

func generate_two_pair():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandTwoPair.append(cardCopy)
	cardCopy.cardValue = "three"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandTwoPair.append(cardCopy)
	cardCopy.cardValue = "three"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandTwoPair.append(cardCopy)
	cardCopy.cardValue = "eight"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandTwoPair.append(cardCopy)
	cardCopy.cardValue = "eight"
	cardCopy.cardSuit = deck.suits[2]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandTwoPair.append(cardCopy)
	cardCopy.cardValue = "two"
	cardCopy.cardSuit = deck.suits[3]

func generate_jacks_or_better():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "jack"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "jack"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "three"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "eight"
	cardCopy.cardSuit = deck.suits[2]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "two"
	cardCopy.cardSuit = deck.suits[3]

func generate_losing_hand():
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "jack"
	cardCopy.cardSuit = deck.suits[3]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "ace"
	cardCopy.cardSuit = deck.suits[0]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "three"
	cardCopy.cardSuit = deck.suits[1]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "eight"
	cardCopy.cardSuit = deck.suits[2]
	cardCopy = cardThing.instantiate()
	add_child(cardCopy)
	debugHandJacksOrBetter.append(cardCopy)
	cardCopy.cardValue = "two"
	cardCopy.cardSuit = deck.suits[3]

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

func debug_show_hand(handArray):
	for handCard in handArray:
		cardCopy = cardThing.instantiate()
		add_child(cardCopy)
		cardCopy.cardValue = deck.values[handCard[0]]
		cardCopy.cardSuit = handCard[1]
		cardCopy.held = false
		cardCopy.position = cardPos.position
		cardCopy.cardFaces.set_animation(handCard[1])
		cardCopy.cardFaces.set_frame(deck.values[handCard[0]] - 1)
		cardPos.position.x += get_viewport_rect().size.y / 5
		cardCopy.emit_particles_that_match_the_suit_of_the_card(cardCopy.cardSuit)
		await get_tree().create_timer(0.5).timeout

func debug_detect_royal_flush():
	var validHand = ["ace", "ten", "jack", "queen", "king"]
	var validValues = []
	var validSuits
	var hand = debugHandRoyalFlush
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
		await get_tree().create_timer(2.5).timeout
		handID.set_text("*airhorns* It's a ROYAL FLUSH!!! *airhorns*")
		winSong.play()
	else:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("No royal flush for you today. Sorry.")

func debug_detect_straight_flush():
	var handValues = []
	var validValues = 0
	var validSuits
	var hand = debugHandJacksOrBetter
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
		await get_tree().create_timer(2.5).timeout
		handID.set_text("It's a straight flush, baby!")
		winSong.play()
	else:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Dang! Were you aiming for a straight flush?")

func debug_detect_four_of_a_kind():
	var handValues = []
	var hand = debugHandJacksOrBetter
	for m in hand:
		handValues.append(m[0])
	handValues.sort_custom(baby_sort)
	if handValues.count(handValues[0]) == 4 || handValues.count(handValues[4]) == 4:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("You found four of a kind!")
		winSong.play()
	else:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("You missed out on four of a kind, my guy!")

func debug_detect_full_house():
	var handValues = []
	var hand = debugHandFullHouse
	var maxValue = 0
	var minValue = 0
	for n in hand:
		handValues.append(n[0])
	maxValue = handValues.max()
	minValue = handValues.min()
	if handValues.count(maxValue) == 3 && handValues.count(minValue) == 2 || handValues.count(maxValue) == 2 && handValues.count(minValue) == 3:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Jeepers, mister! A full house!")
		winSong.play()
	else:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Aw, nuts. I guess you didn't get a full house this time...")

func debug_detect_peasant_flush():
	var handSuits = []
	var hand = debugHandJacksOrBetter
	for o in hand:
		handSuits.append(o[1])
	if handSuits[0] == handSuits[1] && handSuits[0] == handSuits[2] && handSuits[0] == handSuits[3] && handSuits[0] == handSuits[4]:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Wowzers! You mean you got a flush?")
		winSong.play()
	else:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Not even a flush, huh?")

func debug_detect_regular_straight():
	var handValues = []
	var validValues = 0
	var hand = debugHandJacksOrBetter
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
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Hoo, man, that's a straight, alrighty!")
		winSong.play()
	else:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Aw, I thought it was gonna be a straight. :(")

func debug_detect_three_of_a_kind():
	var handValues = []
	var hand = debugHandJacksOrBetter
	for q in hand:
		handValues.append(q[0])
	handValues.sort_custom(baby_sort)
	if handValues.count(handValues[0]) == 3 || handValues.count(handValues[1]) == 3 || handValues.count(handValues[2]) == 3:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Hot diggity dog! A bonafied three of a kind!")
		winSong.play()
	else:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Not even... three of a kind...?")

func debug_detect_two_pair():
	var handValues = []
	var hand = debugHandJacksOrBetter
	for q in hand:
		handValues.append(q[0])
	handValues.sort_custom(baby_sort)
	if handValues.count(handValues[0]) == 2 && handValues.count(handValues[2]) == 2:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Two pair? In this economy?!")
		winSong.play()
	elif handValues.count(handValues[0]) == 2 && handValues.count(handValues[4]) == 2:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Two pair? In this economy?!")
		winSong.play()
	elif handValues.count(handValues[2]) == 2 && handValues.count(handValues[4]) == 2:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Two pair? In this economy?!")
		winSong.play()
	else:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Well, there's only one more winning hand it COULD be...")

func debug_detect_jacks_or_better():
	var handValues = []
	var hand = debugHandJacksOrBetter
	for r in hand:
		handValues.append(r[0])
	if handValues.count("jack") == 2 || handValues.count("queen") == 2 || handValues.count("king") == 2 || handValues.count("ace") == 2:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("That's a pair of jacks or better!!")
		winSong.play()
	else:
		await get_tree().create_timer(2.5).timeout
		handID.set_text("Well, that's all she wrote, mon capitan.")

func baby_sort(a, b):
	if deck.values[a] < deck.values[b]:
		return true
	return false

func debug_detect_all_hands():
	if !debugHandRoyalFlush.is_empty() && handDetection.detect_royal_flush(debugHandRoyalFlush):
		handID.set_text("You win! (Royal flush-style)")
		winSong.play()
	if !debugHandStraightFlush.is_empty() && handDetection.detect_straight_flush(debugHandStraightFlush):
		handID.set_text("You win! (Straight flush-style)")
		winSong.play()
	if !debugHandFourOfAKind.is_empty() && handDetection.detect_four_of_a_kind(debugHandFourOfAKind):
		handID.set_text("You win! (Four-of-a-kind-style)")
		winSong.play()
	if !debugHandFullHouse.is_empty() && handDetection.detect_full_house(debugHandFullHouse):
		handID.set_text("You win! (Full house-style)")
		winSong.play()
	if !debugHandPeasantFlush.is_empty() && handDetection.detect_peasant_flush(debugHandPeasantFlush):
		handID.set_text("You win! (Flush-style)")
		winSong.play()
	if !debugHandRegularStraight.is_empty() && handDetection.detect_regular_straight(debugHandRegularStraight):
		handID.set_text("You win! (Straight-style)")
		winSong.play()
	if !debugHandThreeOfAKind.is_empty() && handDetection.detect_three_of_a_kind(debugHandThreeOfAKind):
		handID.set_text("You win! (Three-of-a-kind-style)")
		winSong.play()
	if !debugHandTwoPair.is_empty() && handDetection.detect_two_pair(debugHandTwoPair):
		handID.set_text("You win! (Two pair-style)")
		winSong.play()
	if !debugHandJacksOrBetter.is_empty() && handDetection.detect_jacks_or_better(debugHandJacksOrBetter):
		handID.set_text("You win! (Better than nothing-style)")
		winSong.play()

func debug_detect_losing_hand():
	handID.set_text("No win for you, muchacho")
	loseSong.play()
