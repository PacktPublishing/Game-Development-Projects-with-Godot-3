extends Piece
class_name WhitePiece

func _ready():
	add_to_group("white_pieces")
	
func get_type() -> String:
	return "WhitePiece"