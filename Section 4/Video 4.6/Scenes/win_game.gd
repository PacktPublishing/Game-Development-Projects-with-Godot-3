extends Control

#func _ready():
#	get_node("Panel/team_wins").text = data.get_winning_team().capitalize() + " team wins!"

func _on_rematch_pressed():
	get_tree().change_scene("res://Scenes/main.tscn")
