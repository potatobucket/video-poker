extends Node2D

@onready var cardFaces = $cardFacesAndBacks

#var spadeAnim = {
#	"ace spade" = cardFaces.set_frame("spade", 0),
#	"two spade" = cardFaces.set_frame("spade", 1),
#	"three spade" = cardFaces.set_frame("spade", 2),
#	"four spade" = cardFaces.set_frame("spade", 3),
#	"five spade" = cardFaces.set_frame("spade", 4),
#	"six spade" = cardFaces.set_frame("spade", 5),
#	"seven spade" = cardFaces.set_frame("spade", 6),
#	"eight spade" = cardFaces.set_frame("spade", 7),
#	"nine spade" = cardFaces.set_frame("spade", 8),
#	"ten spade" = cardFaces.set_frame("spade", 9),
#	"jack spade" = cardFaces.set_frame("spade", 10),
#	"queen spade" = cardFaces.set_frame("spade", 11),
#	"king spade" = cardFaces.set_frame("spade", 12)
#}
#
#var diamondAnim = {
#	"ace diamond" = cardFaces.set_frame("diamond", 0),
#	"two diamond" = cardFaces.set_frame("diamond", 1),
#	"three diamond" = cardFaces.set_frame("diamond", 2),
#	"four diamond" = cardFaces.set_frame("diamond", 3),
#	"five diamond" = cardFaces.set_frame("diamond", 4),
#	"six diamond" = cardFaces.set_frame("diamond", 5),
#	"seven diamond" = cardFaces.set_frame("diamond", 6),
#	"eight diamond" = cardFaces.set_frame("diamond", 7),
#	"nine diamond" = cardFaces.set_frame("diamond", 8),
#	"ten diamond" = cardFaces.set_frame("diamond", 9),
#	"jack diamond" = cardFaces.set_frame("diamond", 10),
#	"queen diamond" = cardFaces.set_frame("diamond", 11),
#	"king diamond" = cardFaces.set_frame("diamond", 12)
#}
#
#var clubAnim = {
#	"ace club" = cardFaces.set_frame("club", 0),
#	"two club" = cardFaces.set_frame("club", 1),
#	"three club" = cardFaces.set_frame("club", 2),
#	"four club" = cardFaces.set_frame("club", 3),
#	"five club" = cardFaces.set_frame("club", 4),
#	"six club" = cardFaces.set_frame("club", 5),
#	"seven club" = cardFaces.set_frame("club", 6),
#	"eight club" = cardFaces.set_frame("club", 7),
#	"nine club" = cardFaces.set_frame("club", 8),
#	"ten club" = cardFaces.set_frame("club", 9),
#	"jack club" = cardFaces.set_frame("club", 10),
#	"queen club" = cardFaces.set_frame("club", 11),
#	"king club" = cardFaces.set_frame("club", 12)
#}
#
#var heartAnim = {
#	"ace heart" = cardFaces.set_frame("heart", 0),
#	"two heart" = cardFaces.set_frame("heart", 1),
#	"three heart" = cardFaces.set_frame("heart", 2),
#	"four heart" = cardFaces.set_frame("heart", 3),
#	"five heart" = cardFaces.set_frame("heart", 4),
#	"six heart" = cardFaces.set_frame("heart", 5),
#	"seven heart" = cardFaces.set_frame("heart", 6),
#	"eight heart" = cardFaces.set_frame("heart", 7),
#	"nine heart" = cardFaces.set_frame("heart", 8),
#	"ten heart" = cardFaces.set_frame("heart", 9),
#	"jack heart" = cardFaces.set_frame("heart", 10),
#	"queen heart" = cardFaces.set_frame("heart", 11),
#	"king heart" = cardFaces.set_frame("heart", 12)
#}
#
#var cardBack = cardFaces.set_frame("cardBack", 3)

var spadeAnim = "spade"
var diamondAnim = "diamond"
var clubAnim = "club"
var heartAnim = "heart"
var cardBack = "cardBack"

func _ready():
#	cardFaces.set_frame(3)
#	set_position(Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2))
	cardFaces.set_animation(cardBack)
	cardFaces.set_frame(3)
	cardFaces.set_scale(Vector2(0.5, 0.5))
