extends Piece
class_name BlackPiece

func _ready():
	is_selectable = false
	
func get_type() -> String:
	return "BlackPiece"