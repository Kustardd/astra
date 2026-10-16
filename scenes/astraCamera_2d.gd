extends Camera2D

#var lim_xpos : float
#var lim_xneg : float
#var lim_ypos: float
#var lim_yneg : float
# Called when the node enters the scene tree for the first time.

@onready var astra = get_parent()
@onready var rendering = astra.get_parent()
@onready var room = rendering.get_parent()

func _ready() -> void:
	#if room.cameraLimits:
	#limit_enabled = true
	limit_left = room.cameraLimits.x
	limit_top = room.cameraLimits.y
	limit_right = room.cameraLimits.z
	limit_bottom = room.cameraLimits.w
	#else: limit_enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(room.get_path())
	print(limit_left)
	#limit_left = lim_xneg
	#limit_bottom = lim_ypos
	#limit_right = lim_xpos
	#limit_top = lim_yneg
