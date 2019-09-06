extends Node2D
class_name Board

const BOARD_DIMENSIONS = Vector2(8, 8)

func _ready():
	generate_tiles()
	
func generate_tiles() -> void:
	for x in range(BOARD_DIMENSIONS.x):
		for y in range(BOARD_DIMENSIONS.y):
			var new_tile = load("res://Prefabs/BoardTile.tscn").instance()
			add_child(new_tile)
			new_tile.set_tile_pos(Vector2(x, y) * 32)
