extends Control

func _ready():
	pass

func _on_retry_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/main.tscn")

#func set_score(value):
#	get_node("Panel/score").text = "Your score was " + str(value) + "!"
#	get_node("Panel/highest_score").text = "Your highest score was " + str(data.get_value("Scores", "highest_score", 0)) + "!"