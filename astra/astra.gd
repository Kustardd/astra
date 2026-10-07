extends CharacterBody2D

@onready var head := get_node("Head")
@onready var arm := get_node("Arm")
@onready var body := get_node("Body")
@onready var treads := get_node("Treads")
@onready var bumps := get_node("Bumps") 

@export var baseSpeed := 300.0
@export var baseAccel := 1500.0
@export var friction := 2000.0
@export var baseSpeedMultiplier := 1.5

@onready var original:= position
@onready var direction:= "front"

var moving:= false

enum Direction {
	Left,
	Right,
	Back,
	Front
}

func _process(delta: float) -> void:
	print(direction)
	play_animation(direction)
	
func play_animation(direction):
	head_animation(direction)
	arm_animation(direction)
	body_animation(direction)
	treads_animation(direction)
	bumps_animation(direction)
	
func head_animation(direction):
	if direction == "front":
		head.play("Front")
	elif direction == "back":
		head.play("Back")
	elif direction == "left":
		head.play("Left")
	else: head.play("Right")
	
func arm_animation(direction):
	if direction == "front":
		arm.play("Front")
	elif direction == "back":
		arm.play("Back")
	elif direction == "left":
		arm.play("Left")
	else: arm.play("Right")
	
func body_animation(direction):
	if direction == "front":
		body.play("Front")
		body.z_index = 1
	elif direction == "back":
		body.play("Back")
		body.z_index = 0
	elif direction == "left":
		body.play("Left")
		body.z_index = 0
	else: 
		body.play("Right")
		body.z_index = 0
		
func treads_animation(direction):
	if moving:
		if direction == "front":
			treads.play("Front")
		elif direction == "back":
			treads.play("Back")
		elif direction == "left":
			treads.play("Left_Move")
		else: treads.play("Right_Move")
	else:
		if direction == "front" or direction == "back":
			treads.stop()
		elif direction == "left":
			treads.play("Left_Stop")
		else: treads.play("Right_Stop")	
	
func bumps_animation(direction):
	if moving:
		if direction == "front":
			bumps.play("Front")
		elif direction == "back":
			bumps.play("Back")
		elif direction == "left":
			bumps.play("Left")
		else: bumps.play("Right")
	else:
		if direction == "front":
			bumps.play("Front")
		elif direction == "back":
			bumps.play("Back")
		elif direction == "left":
			bumps.play("Left")
		else: bumps.play("Right")
		bumps.stop()
		
func _physics_process(delta: float) -> void:
	move_and_slide()
	
	#to find position change
	#if position != original:
		#original = position
		#print(original)
		
	#region kavin's stuff
	#var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var maxSpeed := baseSpeed * baseSpeedMultiplier
	#var targetSpeed := direction * maxSpeed
	#var accelerationRate := baseAccel
	#
	#if direction != Vector2.ZERO:
		#currentState = State.Moving
	#else:
		#currentState = State.Idle
	#
	#match currentState:
		#State.Idle:
			#processIdleState(delta)
		#State.Moving:
			#processMovingState(direction, delta)
			#
	##playAnimation()
	#move_and_slide()
	#
#func processIdleState(delta: float):
	#velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	#
#func processMovingState(direction: Vector2, delta: float):
	#var maxSpeed = baseSpeed * baseSpeedMultiplier
	#var targetSpeed = direction * maxSpeed
	#velocity = velocity.move_toward(targetSpeed, baseAccel * delta)
	#
#func updateDirection(directionVector: Vector2):
	#if abs(directionVector.x) > abs(directionVector.y):
		#if directionVector.x > 0:
			#currentDirection = Direction.Right
		#else: 
			#currentDirection = Direction.Left
	#else: 
		#if directionVector.y > 0:
			#currentDirection = Direction.Front
		#else: 
			#currentDirection = Direction.Back
			
# Work in progress - zilin u do it ur way hehe @nikki_aint_it
#endregion
