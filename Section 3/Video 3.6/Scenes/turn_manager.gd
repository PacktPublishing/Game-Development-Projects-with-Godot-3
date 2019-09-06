extends Node

signal set_turn

var current_turn = WhitePiece

func _ready():
	pass

func switch_turns() -> void:
	if current_turn == WhitePiece:
		current_turn = BlackPiece
	else:
		current_turn = WhitePiece
		
	emit_signal("set_turn", current_turn)