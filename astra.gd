extends CharacterBody2D


@export var baseSpeed := 300.0
@export var baseAccel := 1500.0
@export var baseJumpVel := -400.0
@export var friction := 2000.0
@export var baseSpeedMultiplier := 1.5


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	var maxSpeed := baseSpeed * baseSpeedMultiplier
	var targetSpeed := direction * maxSpeed
	var accelerationRate := baseAccel
	if direction != 0:
		accelerationRate = baseAccel
	else:
		accelerationRate = friction
		
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = baseJumpVel
		
	velocity.x = move_toward(velocity.x, targetSpeed, accelerationRate * delta)

	move_and_slide()
