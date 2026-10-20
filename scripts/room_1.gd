extends Node2D

@export var cameraLimLeft: float
@export var cameraLimRight: float
@export var cameraLimTop: float
@export var cameraLimBottom: float
var cameraLimits: Vector4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#cameraLimits = Vector4(cameraLim_xneg, cameraLim_yneg, cameraLim_xpos, cameraLim_ypos)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
