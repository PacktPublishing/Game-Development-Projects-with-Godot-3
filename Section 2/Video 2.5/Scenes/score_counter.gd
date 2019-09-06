extends Label

var score = 0
var combo = 1

func _ready():
	pass

func add_score(value: int) -> void:
	score += value*combo
	text = str(score)
	
	combo += 1
	get_node("combo_timer").start()
	
	

func _on_combo_timer_timeout():
	combo = 1
