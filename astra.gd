extends CharacterBody2D

@export var baseSpeed := 300.0
@export var baseAccel := 1500.0
@export var friction := 2000.0
@export var baseSpeedMultiplier := 1.5

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var maxSpeed := baseSpeed * baseSpeedMultiplier
	var targetSpeed := direction * maxSpeed
	var accelerationRate := baseAccel
	
	if direction != Vector2.ZERO:
		accelerationRate = baseAccel
	else:
		accelerationRate = friction
		
	velocity = velocity.move_toward(targetSpeed, accelerationRate * delta)

	move_and_slide()
	
func controllerBindings():
	pass
