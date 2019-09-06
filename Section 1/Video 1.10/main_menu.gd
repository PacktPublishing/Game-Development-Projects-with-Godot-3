extends Node2D



func _ready():
	pass


func _on_play_pressed():
	get_tree().change_scene("res://main.tscn")

func _on_quit_pressed():
	get_tree().quit()
