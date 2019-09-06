extends RigidBody2D

signal died

var SPEED = 600
var MAX_SPEED = 200
onready var player = get_node("../player")

func _ready():
	pass

func _process(delta):
	
	get_node("Sprite").modulate.h += 0.5*delta
	
	var angle_to_player = position.angle_to_point(player.position)
	var movement_vector = Vector2(-1, 0).rotated(angle_to_player)
	
	linear_velocity += movement_vector*SPEED*delta
	
	linear_velocity.x = min(max(linear_velocity.x, -MAX_SPEED), MAX_SPEED)
	linear_velocity.y = min(max(linear_velocity.y, -MAX_SPEED), MAX_SPEED)

func _on_enemy_body_entered(body):
	if(body == player):
		emit_signal("died")
		queue_free()
