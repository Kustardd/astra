extends Node2D

@export var cameraLimLeft: float = -100000000
@export var cameraLimRight: float = 100000000
@export var cameraLimTop: float = -1000000
@export var cameraLimBottom: float = 1000000
var cameraLimits: Vector4

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func exitScene(room):
	get_tree().change_scene_to_file.call_deferred(room)
