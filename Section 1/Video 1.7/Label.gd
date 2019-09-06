extends Label

var score = 0

func _ready():
	pass

func _process(delta):
	text = str(score)
	
func increment_score():
	score += 100
	