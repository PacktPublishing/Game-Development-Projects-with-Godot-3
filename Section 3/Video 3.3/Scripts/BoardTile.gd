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
	
func get_tile_coord_pos() -> Vector2:
	var coord_position = position/32
	
	coord_position.x = int(coord_position.x)
	coord_position.y = int(coord_position.y)
	
	return coord_position
	
func remove_piece() -> void:
	piece["exists"] = false
	piece["piece"] = null
	
	emit_signal("remove_piece")
	
func set_piece(new_piece) -> void:
	piece["exists"] = true
	piece["piece"] = new_piece
	
	new_piece.position = position + Vector2(16, 16)
	new_piece.connect("leaving_tile", self, "remove_piece")
	
	emit_signal("add_piece")