extends RigidBody2D

func _ready():
	for ball in get_tree().get_nodes_in_group("balls"):
		add_collision_exception_with(ball)

	add_collision_exception_with(get_node("../walls"))

	linear_damp = 0