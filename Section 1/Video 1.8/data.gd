extends Node

onready var data = ConfigFile.new()

func _ready():
	data.load("user://save_data.cfg")
	
func save(path="user://save_data.cfg"):
	data.save(path)
	
func get_value(section, key, default=null):
	return data.get_value(section, key, default)
	
func set_value(section, key, value):
	data.set_value(section, key, value)
	
func get_section_keys(section):
	return data.get_section_keys(section)