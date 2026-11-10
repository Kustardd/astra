extends Camera2D

@onready var astra = get_parent()
@onready var rendering = astra.get_parent()
@onready var room = rendering.get_parent()

func _ready() -> void:
	limit_left = room.cameraLimLeft
	limit_top = room.cameraLimTop
	limit_right = room.cameraLimRight
	limit_bottom = room.cameraLimBottom

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
