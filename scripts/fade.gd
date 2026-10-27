extends CanvasLayer
@onready var rect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rect.color.a = 0.0

func fade(target_alpha: float, duration: float = 1.0):
	var tween = create_tween()
	tween.tween_property(rect, "color:a", target_alpha, duration)
	return tween
