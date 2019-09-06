extends Node2D
class_name ClickEvent

signal die
signal ready_to_click

var enabled = false

var piece: Piece
var destination: BoardTile

func _ready():
	pass

func _input(event):
	if enabled:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT:
				if event.is_pressed():
					
					var click_location = get_global_mouse_position()
					click_location /= 32
					click_location.x = int(click_location.x)
					click_location.y = int(click_location.y)
					
					destination = get_node("/root/Node2D").get_tile_by_pos(click_location)
					
					emit_signal("die", piece, destination)
					queue_free()

func _on_Timer_timeout():
	enabled = true
	emit_signal("ready_to_click")