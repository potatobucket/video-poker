extends Node2D
class_name UI

@onready var player = PlayerData
@onready var startingMoney = player.startingMonies
@onready var playerMoney = player.currentMonies
@onready var currentBet = player.currentBet
@onready var minBet = player.minimumBet
@onready var maxBet = player.maximumBet
@onready var moneyLabel = $textContainer/moneyCount
@onready var currentBetLabel = $textContainer/currentBet

func _ready():
	if playerMoney == null:
		playerMoney = startingMoney
	moneyLabel.set_text("Credit: %s" % playerMoney)
	currentBet = minBet
	currentBetLabel.set_text("Current bet: %s" % currentBet)

func _on_bet_up_button_pressed():
	if currentBet < maxBet:
		currentBet += 1
		currentBetLabel.set_text("Current bet: %s" % currentBet)

func _on_bet_down_button_pressed():
	if currentBet > minBet:
		currentBet -= 1
		currentBetLabel.set_text("Current bet: %s" % currentBet)
