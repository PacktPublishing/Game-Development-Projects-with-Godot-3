extends Node2D

func _ready():
	randomize()
	
func spawn_enemy():
	var enemy = load("res://enemy.tscn").instance()
	enemy.position = Vector2(100 + randf()*1652, 100 + randf()*1400)
	enemy.connect("died", get_node("CanvasLayer/Label"), "increment_score")
	add_child(enemy)

func _on_spawn_timer_timeout():
	if(randi()%2 == 0):
		spawn_enemy()