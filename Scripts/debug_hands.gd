extends Node2D

#-- this script lets me me generate rarer hands (like royal flush or straight
#-- flush or what have you) instead of having to rely on random chance

@onready var card = Card
@onready var deck = Deck
@onready var cardThing = preload("res://Scenes/card.tscn")
@onready var cardCopy = cardThing.instantiate()
@onready var cardPos = $cardPos
@onready var handID = $handID
@onready var winSong = $winSong

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
	generate_jacks_or_better()
#	print(debugHandRoyalFlush)
	debug_show_hand(debugHandJacksOrBetter)
	debug_detect_royal_flush()
	await get_tree().create_timer(2.5).timeout
	debug_detect_straight_flush()
	await get_tree().create_timer(2.5).timeout
	debug_detect_four_of_a_kind()
	await get_tree().create_timer(2.5).timeout
	debug_detect_full_house()
	await get_tree().create_timer(2.5).timeout
	debug_detect_peasant_flush()
	await get_tree().create_timer(2.5).timeout
	debug_detect_regular_straight()
	await get_tree().create_timer(2.5).timeout
	debug_detect_three_of_a_kind()
	await get_tree().create_timer(2.5).timeout
	debug_detect_two_pair()
	await get_tree().create_timer(2.5).timeout
	debug_detect_jacks_or_better()

func generate_royal_flush():
	debugHandRoyalFlush.append(deck.deck[0])
	debugHandRoyalFlush.append(deck.deck[9])
	debugHandRoyalFlush.append(deck.deck[10])
	debugHandRoyalFlush.append(deck.deck[11])
	debugHandRoyalFlush.append(deck.deck[12])
#	debugHandRoyalFlush.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandRoyalFlush.sort_custom(debug_sort_by_value_and_then_suit)

func generate_straight_flush():
	debugHandStraightFlush.append(deck.deck[28])
	debugHandStraightFlush.append(deck.deck[29])
	debugHandStraightFlush.append(deck.deck[30])
	debugHandStraightFlush.append(deck.deck[31])
	debugHandStraightFlush.append(deck.deck[32])
#	debugHandStraightFlush.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandStraightFlush.sort_custom(debug_sort_by_value_and_then_suit)

func generate_four_of_a_kind():
	debugHandFourOfAKind.append(deck.deck[7])
	debugHandFourOfAKind.append(deck.deck[20])
	debugHandFourOfAKind.append(deck.deck[33])
	debugHandFourOfAKind.append(deck.deck[46])
	debugHandFourOfAKind.append(deck.deck[39])
	debugHandFourOfAKind.sort_custom(debug_sort_by_suit_and_then_value)
#	debugHandFourOfAKind.sort_custom(debug_sort_by_value_and_then_suit)

func generate_full_house():
	debugHandFullHouse.append(deck.deck[0])
	debugHandFullHouse.append(deck.deck[13])
	debugHandFullHouse.append(deck.deck[38])
	debugHandFullHouse.append(deck.deck[12])
	debugHandFullHouse.append(deck.deck[25])
#	debugHandFullHouse.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandFullHouse.sort_custom(debug_sort_by_value_and_then_suit)

func generate_peasant_flush():
	debugHandPeasantFlush.append(deck.deck[9])
	debugHandPeasantFlush.append(deck.deck[4])
	debugHandPeasantFlush.append(deck.deck[8])
	debugHandPeasantFlush.append(deck.deck[7])
	debugHandPeasantFlush.append(deck.deck[11])
	debugHandPeasantFlush.sort_custom(debug_sort_by_suit_and_then_value)
#	debugHandPeasantFlush.sort_custom(debug_sort_by_value_and_then_suit)

func generate_straight():
	debugHandRegularStraight.append(deck.deck[1])
	debugHandRegularStraight.append(deck.deck[15])
	debugHandRegularStraight.append(deck.deck[29])
	debugHandRegularStraight.append(deck.deck[43])
	debugHandRegularStraight.append(deck.deck[44])
#	debugHandRegularStraight.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandRegularStraight.sort_custom(debug_sort_by_value_and_then_suit)

func generate_three_of_a_kind():
	debugHandThreeOfAKind.append(deck.deck[0])
	debugHandThreeOfAKind.append(deck.deck[13])
	debugHandThreeOfAKind.append(deck.deck[26])
	debugHandThreeOfAKind.append(deck.deck[43])
	debugHandThreeOfAKind.append(deck.deck[44])
#	debugHandThreeOfAKind.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandThreeOfAKind.sort_custom(debug_sort_by_value_and_then_suit)

func generate_two_pair():
	debugHandTwoPair.append(deck.deck[3])
	debugHandTwoPair.append(deck.deck[16])
	debugHandTwoPair.append(deck.deck[5])
	debugHandTwoPair.append(deck.deck[18])
	debugHandTwoPair.append(deck.deck[8])
#	debugHandTwoPair.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandTwoPair.sort_custom(debug_sort_by_value_and_then_suit)

func generate_jacks_or_better():
	debugHandJacksOrBetter.append(deck.deck[0])
	debugHandJacksOrBetter.append(deck.deck[13])
	debugHandJacksOrBetter.append(deck.deck[5])
	debugHandJacksOrBetter.append(deck.deck[28])
	debugHandJacksOrBetter.append(deck.deck[37])
#	debugHandJacksOrBetter.sort_custom(debug_sort_by_suit_and_then_value)
	debugHandTwoPair.sort_custom(debug_sort_by_value_and_then_suit)

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
	var hand = debugHandJacksOrBetter
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
	var hand = debugHandJacksOrBetter
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
