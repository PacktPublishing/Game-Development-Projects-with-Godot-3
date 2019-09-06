extends Node2D

func _ready():
	randomize()

func spawn_ball():
	var ball = load("res://Prefabs/ball.tscn").instance()
	
	ball.position = $ball_spawnpoint.position
	ball.linear_velocity = Vector2(0, -200).rotated(0.3 + 0.4*randf()*PI)
	
	ball.connect(
		"body_entered", #signal name
		self, #target node
		"ball_collided", #method in target node
		[ball]
	)
	
	add_child(ball)

func ball_collided(body, ball):
	if(body == get_node("player")):
		get_node("CanvasLayer/score_counter").add_score(100)
		
		var combo_popup = load("res://Prefabs/combo_popup.tscn").instance()
		combo_popup.set_combo(get_node("CanvasLayer/score_counter").combo)
		get_node("CanvasLayer").add_child(combo_popup)
		
		var angle = randf()*2*PI
		combo_popup.position = ball.position + Vector2(-50, 0).rotated(angle)
		
		