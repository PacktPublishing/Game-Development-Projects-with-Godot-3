extends Node2D

func _ready():
	randomize()
	var list_of_obstacles = []
	
	var directory = Directory.new()
	
	if(directory.open("res://Prefabs/Obstacles") == OK):
		directory.list_dir_begin()
		
		var file_name = directory.get_next()
		while (not(file_name == "")):
			if(not(directory.current_is_dir())):
				list_of_obstacles.append(file_name)
				
			file_name = directory.get_next()
	else: 
		print("Couldn't open directory. :(")

	var obstacle_path = list_of_obstacles[randi()%list_of_obstacles.size()]
	var obstacle = load("res://Prefabs/Obstacles/" + obstacle_path).instance()
	add_child(obstacle)