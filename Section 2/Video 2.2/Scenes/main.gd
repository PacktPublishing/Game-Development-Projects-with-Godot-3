extends Node2D



func _ready():
	randomize()

func spawn_ball():
	var ball = load("res://Prefabs/ball.tscn").instance()
	
	ball.position = $ball_spawnpoint.position
	ball.linear_velocity = Vector2(0, -200).rotated(0.3 + 0.4*randf()*PI)
	
	add_child(ball)