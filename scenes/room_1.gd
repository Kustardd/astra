extends Node2D

@export var cameraLim_xpos: float
@export var cameraLim_xneg: float
@export var cameraLim_ypos: float
@export var cameraLim_yneg: float
var cameraLimits: Vector4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cameraLimits = Vector4(cameraLim_xneg, cameraLim_yneg, cameraLim_xpos, cameraLim_ypos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(cameraLimits)
