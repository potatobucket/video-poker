extends Node
class_name Player

var startingMonies = 50
var currentMonies
var minimumBet = 1
var maximumBet = 10
var currentBet
var wins = 0.0
var losses = 0.0
var totalGamesPlayed = 0
var winPercentage = 0.00

#-- gives a floating point number for the player's win percentage
#-- it might be only tracked internally or, perhaps, deleted altogether
func determine_win_percentage():
	if totalGamesPlayed > 0:
		winPercentage = wins / totalGamesPlayed
	else:
		winPercentage = 0.00
