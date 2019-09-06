extends Node

var winning_team = ""

func _ready():
	pass

func set_winning_team(team: String) -> void:
	winning_team = team
	
func get_winning_team() -> String:
	return winning_team