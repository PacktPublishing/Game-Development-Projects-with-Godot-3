extends Node2D
class_name Piece

signal leaving_tile

onready var board = get_node("/root/Node2D")

func _ready():
	pass

func get_current_tile() -> BoardTile:
	var tile_position = position/32
	
	tile_position.x = int(tile_position.x)
	tile_position.y = int(tile_position.y)
	
	return board.get_tile_by_pos(tile_position)

func _on_Button_pressed() -> void:
	var click_event = board.spawn_click_event()
		
	click_event.piece = self