extends Node2D

@export var cameraLimLeft: float = -100000
@export var cameraLimRight: float = 100000
@export var cameraLimTop: float = -1000000
@export var cameraLimBottom: float = 1000000
var cameraLimits: Vector4

@export var fadeDuration : float = 0.5
@onready var fade : CanvasLayer = get_node("Fade")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func exitScene(room):
	fade.fade(1.0, fadeDuration)
	await get_tree().create_timer(fadeDuration).timeout
	get_tree().change_scene_to_file.call_deferred(room)
