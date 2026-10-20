extends Node2D

@export var cameraLimLeft: float
@export var cameraLimRight: float
@export var cameraLimTop: float
@export var cameraLimBottom: float
var cameraLimits: Vector4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Saves.scene_loaded.emit(true)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#cameraLimits = Vector4(-1000000.0,-1000000.0, 1000000, 1000000)
	pass
