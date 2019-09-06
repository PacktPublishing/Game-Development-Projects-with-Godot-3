extends Node2D
class_name Piece

signal leaving_tile

var is_selectable = true

onready var board = get_node("/root/Node2D")

func _ready():
	pass

func get_current_tile() -> BoardTile:
	var tile_position = position/32
	
	tile_position.x = int(tile_position.x)
	tile_position.y = int(tile_position.y)
	
	return board.get_tile_by_pos(tile_position)

func _on_Button_pressed() -> void:
	if is_selectable:
		var click_event = board.spawn_click_event()
		click_event.piece = self
		
func set_turn(team) -> void:
	if self is team:
		is_selectable = true
	else:
		is_selectable = false