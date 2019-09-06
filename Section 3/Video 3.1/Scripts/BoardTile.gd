extends Node2D
class_name BoardTile

# Emitted when Piece is removed from this tile
signal remove_piece
# Emitted when a new Piece is added to this tile
signal add_piece

# Data structure for Piece node that this tile is holding
var piece = {
	"exists": false,
	"piece": null #class Piece
}

func _ready():
	pass

func get_tile_pos() -> Vector2:
	return position
	
func set_tile_pos(new_position: Vector2) -> void:
	position = new_position
	
func remove_piece() -> void:
	piece["exists"] = false
	piece["piece"] = null
	
	emit_signal("remove_piece")
	
func set_piece(piece) -> void:
	piece["exists"] = true
	piece["piece"] = piece
	
	emit_signal("add_piece")