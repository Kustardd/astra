extends CharacterBody2D

#added edit for practice push in Github

@onready var head := get_node("Head")
@onready var arm := get_node("Arm")
@onready var body := get_node("Body")
@onready var treads := get_node("Treads")
@onready var bumps := get_node("Bumps") 

@export var baseSpeed := 300.0
@export var baseAccel := 1500.0
@export var friction := 2000.0
@export var baseSpeedMultiplier := 1.5

const SAVE_PATH = "user://saves.cfg"
@onready var chosen_version = "Save1"
@onready var original:= position
@onready var og_direction = true
@onready var direction = "front"

func load_direction(save_version):
	var save_file = ConfigFile.new()
	var error = save_file.load(SAVE_PATH)
	if error != OK:
		print("No saved direction, starting from original direction.")
	else:
		print("Loaded to saved direction.")
		direction = save_file.get_value("Player_Direction", save_version, "front")



var moving:= false

enum Direction {
	Left,
	Right,
	Back,
	Front
}

func _process(_delta: float) -> void:
	if og_direction == true:
		load_direction(chosen_version)
		og_direction = false
	
	play_animation(direction)
	
func play_animation(movement_direction): #changed the name of this and following parameters since it was causing a shadowed variable error, the name of the variable was the same as the name of the parameter it was filling
	head_animation(movement_direction)
	arm_animation(movement_direction)
	body_animation(movement_direction)
	treads_animation(movement_direction)
	bumps_animation(movement_direction)
	
func head_animation(movement_direction):
	if movement_direction == "front":
		head.play("Front")
	elif movement_direction == "back":
		head.play("Back")
	elif movement_direction == "left":
		head.play("Left")
	else: head.play("Right")
	
func arm_animation(movement_direction):
	if movement_direction == "front":
		arm.play("Front")
	elif movement_direction == "back":
		arm.play("Back")
	elif movement_direction == "left":
		arm.play("Left")
	else: arm.play("Right")
	
func body_animation(movement_direction):
	if movement_direction == "front":
		body.play("Front")
		body.z_index = 1
	elif movement_direction == "back":
		body.play("Back")
		body.z_index = 0
	elif movement_direction == "left":
		body.play("Left")
		body.z_index = 0
	else: 
		body.play("Right")
		body.z_index = 0
		
func treads_animation(movement_direction):
	if moving:
		if movement_direction == "front":
			treads.play("Front")
		elif movement_direction == "back":
			treads.play("Back")
		elif movement_direction == "left":
			treads.play("Left_Move")
		else: treads.play("Right_Move")
	else:
		if movement_direction == "front" or movement_direction == "back":
			treads.stop()
		elif movement_direction == "left":
			treads.play("Left_Stop")
		else: treads.play("Right_Stop")
	
func bumps_animation(movement_direction):
	if moving:
		if movement_direction == "front":
			bumps.play("Front")
		elif movement_direction == "back":
			bumps.play("Back")
		elif movement_direction == "left":
			bumps.play("Left")
		else: bumps.play("Right")
	else:
		if movement_direction == "front":
			bumps.play("Front")
		elif movement_direction == "back":
			bumps.play("Back")
		elif movement_direction == "left":
			bumps.play("Left")
		else: bumps.play("Right")
		bumps.stop()
		
func _physics_process(_delta: float) -> void:
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
