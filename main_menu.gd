extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Buttons/Start.pressed.connect(_on_start_pressed)
	$Buttons/Options.pressed.connect(_on_options_pressed)
	$Buttons/Quit.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://astra.tscn")
	
func _on_options_pressed():
	pass
	
func _on_quit_pressed():
	get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
