extends Piece
class_name BlackPiece

func _ready():
	is_selectable = false
	add_to_group("black_pieces")
	
func get_type() -> String:
	return "BlackPiece"