extends AudioStreamPlayer

signal song_changed

const music_options = {
	"default": preload("res://Sound/ghost_town.ogg")
}

var ingame_songs = ["default"]
var target_song = ""
var fading = false
var popped = false
var dummy_player
var music_bus 

func _ready():
	# music bus that this singleton will interface with
	music_bus = AudioServer.get_bus_index("music")
	stream = music_options["default"]
	bus = "music"
	play()
	
	# "fake" player that will help us with cross-fading
	dummy_player = AudioStreamPlayer.new()
	dummy_player.bus = "music"
	add_child(dummy_player)
	
	
func _process(delta):
	#everything in this function is for cross-fading. complicated. yuck.
	if(fading):
		dummy_player.volume_db += delta*60
		volume_db -= delta*60
		
		if(dummy_player.volume_db >= 0):
			dummy_player.volume_db = 0
			fading = false
			stream = music_options[target_song]
			play(dummy_player.get_playback_position())
			dummy_player.stop()
			volume_db = 0
			popped = false

	if(get_playback_position() >= stream.get_length() - 0.5 and not(popped)):
		play_new_ingame_song()
		popped = true
	
func play_song(song):
	target_song = song
	fading = true
	dummy_player.stream = music_options[song]
	dummy_player.volume_db = -60
	dummy_player.play()
	
func set_decimal_volume(volume):
	AudioServer.set_bus_volume_db(music_bus, -60 + 60*volume/100)

func get_decimal_volume():
	return ((AudioServer.get_bus_volume_db(music_bus)/60)+1)*100

func init_ingame_music():
	connect("finished", self, "play_new_ingame_song") #when we're done, play a new song
	play_new_ingame_song()
	
# plays a random song from "ingame_songs" list
func play_new_ingame_song():
	var song = ingame_songs[randi()%ingame_songs.size()]
	play_song(song)