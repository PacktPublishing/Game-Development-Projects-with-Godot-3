extends Label

var score = 0

func _ready():
	pass

func _process(delta):
	text = str(score)
	if(score > data.get_value("Scores", "highest_score", 0)):
		text += "!"
	
func increment_score():
	score += 100
	