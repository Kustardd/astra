extends Node

const PLAYER_SCENE = preload("res://scenes/astra.tscn")
const SAVE_PATH = "user://saves.cfg"
@onready var starting_room : String
@onready var astra = CharacterBody2D
@onready var scene : String
@onready var game_start := false
@onready var data_loaded := false
@onready var scene_filepath : String
signal scene_loaded(loaded: bool)
@onready var start_pos : Marker2D
var chosen_save = "Save1" #change this when adding different save files, save_version will depend on which save file the user selects by clicking

func save_data(save_version, player, room):
	var current_pos_2d = player.global_position
	print(current_pos_2d)
	var save_file = ConfigFile.new()
	save_file.set_value("Player_Coordinates", save_version, current_pos_2d)
	save_file.set_value("Player_Direction", save_version, player.direction)	
	save_file.set_value("Room/Scene", save_version, room)
	var error = save_file.save(SAVE_PATH)
	if error == OK:
		print("Saved")
	else:
		print("Didn't work :(")
	
	
func start_saving(loaded: bool):
	if loaded == true:
		game_start = true
		loaded = false
		
func load_scene(save_version):
	var save_file = ConfigFile.new()
	var error = save_file.load(SAVE_PATH)
	if error != OK:
		print("No saved scene, starting from original scene.")
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	
	var room = save_file.get_value("Room/Scene", save_version, "res://scenes/world.tscn")
	if room == null:
		#print("Scene loading didn't work")
		pass
	else:
		get_tree().change_scene_to_file(room)

func load_data(save_version, player):
	var save_file = ConfigFile.new()
	var error = save_file.load(SAVE_PATH)
	if error != OK:
		print("No saved position, starting from original position.")
		player.global_position = start_pos.global_position
		
	var current_pos_2d = save_file.get_value("Player_Coordinates", save_version, Vector2.ZERO)
	player.direction = save_file.get_value("Player_Direction", save_version, "front")
	player.global_position = current_pos_2d
	print("Loaded to saved position. Good Luck!")
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("This function works.")
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
##Do not delete the print functions, they are essential for testing the save script, leave them as commented.
func _process(delta: float) -> void:
	if not Saves.scene_loaded.is_connected(start_saving):
		Saves.scene_loaded.connect(start_saving)
		#print("signal has been connected and apparently received.")
		
	else:
		#print("The signal is already connected or start hasn't been pressed yet.")
		pass
		
	if game_start == true:
		if data_loaded == false:
			load_scene(chosen_save)
			set_process(false)
			await get_tree().create_timer(delta).timeout
			set_process(true)
			astra = get_tree().get_current_scene().find_child("Astra", true, false)
			#print("So the data is being loaded, this should only happen once the game_start equals true and the scene and start_pos have been assigned.")
			load_data(chosen_save, astra)
			data_loaded = true
		else:
			pass
		
		#scene = get_tree().current_scene.get_path()
		astra = get_tree().get_current_scene().find_child("Astra", true, false)
		scene_filepath = get_tree().current_scene.scene_file_path
		start_pos = get_tree().get_current_scene().find_child("StartPosition", true, false)
		#print("This is the filepath for the scene", scene_filepath)
		#print("This is the scene path", scene)
		#print("This is the marker 2d node", start_pos)
		#print("the difference between the scene variable and the string version of it", str(scene))
		
		if scene_filepath == "res://scenes/world.tscn":
			#print("This is the astra node being printed again, which should happen in the world scene", astra)
			#print("This code should be running")
			save_data(chosen_save, astra, scene_filepath)
			#print("hello")
		elif scene_filepath == "res://scenes/room_1.tscn":
			#print("This code should be running part 2")
			astra = get_tree().get_current_scene().find_child("Astra", true, false)
			save_data(chosen_save, astra, scene_filepath)
			#print("This is the astra node being printed again but instead, it should happen when in the room1 scene", astra)
			#print("hi")
	else:
		#print("game_start doesn't equal true apparently")
		pass
		
		
	
	#print("This is a third astra node print for some reason", astra)
	#print("bye")
