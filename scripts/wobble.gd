extends AnimatedSprite2D

@export var wobbleLength: int
@export var wobbleStrength: int
@onready var origin := position.y
@onready var direction := 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (abs(origin-position.y)-wobbleLength)>=wobbleLength:
		direction*= -1
	position.y +=wobbleStrength*direction*delta
