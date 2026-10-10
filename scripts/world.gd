extends Node2D

const PLAYER_SCENE = preload("res://astra/astra.tscn")
const SAVE_PATH = "user://saves.cfg"
@onready var player = $Outside/Rendering/Astra
@onready var start_pos = $StartPosition
@onready var astra = $Outside/Rendering/Astra
var chosen_save = "Save1" #change this when adding different save files, save_version will depend on which save file the user selects by clicking

func save_data(save_version):
	var current_pos_2d = player.global_position
	print(current_pos_2d)
	var save_file = ConfigFile.new()
	save_file.set_value("Player_Coordinates", save_version, current_pos_2d)
	save_file.set_value("Player_Direction", save_version, astra.direction)
	var error = save_file.save(SAVE_PATH)
	if error == OK:
		print("Saved")
	else:
		print("Didn't work :(")
	

func load_coordinates(save_version):
	var save_file = ConfigFile.new()
	var error = save_file.load(SAVE_PATH)
	if error != OK:
		print("No saved position, starting from original position.")
		player.global_position = start_pos.global_position
	
	var current_pos_2d = save_file.get_value("Player_Coordinates", save_version, Vector2.ZERO)
	#astra.direction = save_file.get_value("Player_Direction", save_version, "front")
	player.global_position = current_pos_2d
	print("Loaded to saved position. Good Luck!")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_coordinates(chosen_save)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	call_deferred("save_data", chosen_save)
