extends Area2D

var lives = 3

func _ready():
	pass 

func lose_game():
	
	var lose_popup = load("res://Prefabs/lose_popup.tscn").instance()
	lose_popup.rect_position = OS.window_size / 2
	get_node("..").add_child(lose_popup)
	
	get_tree().paused = true

func _on_lose_zone_body_entered(body):
	if(body in get_tree().get_nodes_in_group("balls")):
		body.queue_free()
		lives -= 1
		
		if(lives == 0):
			lose_game()