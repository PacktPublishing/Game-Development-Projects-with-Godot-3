extends Node2D
class_name Board

const BOARD_DIMENSIONS = Vector2(8, 8)

var board_array = [
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[]
]

onready var turn_manager = get_node("turn_manager")

func _ready():
	generate_tiles()
	generate_pieces()
	
func generate_tiles() -> void:
	for x in range(BOARD_DIMENSIONS.x):
		for y in range(BOARD_DIMENSIONS.y):
			var new_tile = load("res://Prefabs/BoardTile.tscn").instance()
			add_child(new_tile)
			new_tile.set_tile_pos(Vector2(x, y) * 32)
			
			board_array[x].append(new_tile)

func generate_pieces() -> void:
	for y in range(3):
		for x in range(0 + y%2, 8 + y%2, 2):
			var new_piece = load("res://Prefabs/WhitePiece.tscn").instance()
			add_child(new_piece)
			get_tile_by_pos(Vector2(x, y)).set_piece(new_piece)
			turn_manager.connect("set_turn", new_piece, "set_turn")
			
	for y in range(5, 8):
		for x in range(0 + y%2, 8 + y%2, 2):
			var new_piece = load("res://Prefabs/BlackPiece.tscn").instance()
			add_child(new_piece)
			get_tile_by_pos(Vector2(x, y)).set_piece(new_piece)
			turn_manager.connect("set_turn", new_piece, "set_turn")
	
func get_tile_by_pos(tile_pos: Vector2) -> BoardTile:
	return board_array[tile_pos.x][tile_pos.y]
	
func remove_piece_at_tile(tile: BoardTile) -> void:
	if tile.piece["exists"]:
		tile.destroy_piece()
	
func spawn_click_event() -> ClickEvent:
	var click_event = load("res://Prefabs/click_event.tscn").instance()
	register_click_event(click_event)
	
	return click_event
	
func register_click_event(click_event: ClickEvent) -> void:
	add_child(click_event)
	
	click_event.connect("die", self, "move_piece")
	
func move_piece(piece: Piece, destination: BoardTile) -> void:
	
	if not(is_instance_valid(piece)):
		return
	
	var current_tile = piece.get_current_tile()
	var y_direction = 1 if piece is WhitePiece else -1
		
	if destination.piece["exists"] == true:
		var pos_difference =  destination.get_tile_coord_pos() - piece.get_current_tile().get_tile_coord_pos()
		
		if pos_difference.length() < 2 and piece.is_enemy_of(destination.piece["piece"]):
			var error_code = jump_piece(piece, get_tile_by_pos(piece.get_current_tile().get_tile_coord_pos() + pos_difference*2))
		
			if error_code == OK:
				remove_piece_at_tile(destination)
			
		return
	
	if abs(destination.get_tile_coord_pos().x - current_tile.get_tile_coord_pos().x) == 1:
		if destination.get_tile_coord_pos().y - current_tile.get_tile_coord_pos().y == y_direction:
			piece.emit_signal("leaving_tile")
			destination.set_piece(piece)
			turn_manager.switch_turns()
			
func jump_piece(piece: Piece, destination: BoardTile) -> int:
	var current_tile = piece.get_current_tile()
	var y_direction = 2 if piece is WhitePiece else -2
	
	if destination.piece["exists"] == true:
		return ERR_ALREADY_EXISTS
	
	if abs(destination.get_tile_coord_pos().x - current_tile.get_tile_coord_pos().x) == 2:
		if destination.get_tile_coord_pos().y - current_tile.get_tile_coord_pos().y == y_direction:
			piece.emit_signal("leaving_tile")
			destination.set_piece(piece)
			turn_manager.switch_turns()
			
	return OK