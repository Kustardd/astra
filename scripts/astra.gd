extends CharacterBody2D

#added edit for practice push in Github

@onready var head := get_node("Head")
@onready var arm := get_node("Arm")
@onready var body := get_node("Body")
@onready var treads := get_node("Treads")
@onready var bumps := get_node("Bumps") 

@export var inv: Inv
@export var baseSpeed := 300.0
@export var baseAccel := 1500.0
@export var friction := 2000.0
@export var baseSpeedMultiplier := 1.5

@onready var original:= position
@onready var direction = "front"
var moving:= false

##@onready var e := $"E for Interact"
#var eVisibility := false

func _process(_delta: float) -> void:
	play_animation(direction)

#region animations

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
		body.z_index = 0
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
			treads.play("Front")
			treads.stop()
		elif movement_direction == "left":
			treads.play("Left_Stop")
		else: treads.play("Right_Stop")
	if movement_direction == "front":
		treads.z_index = 0
	else:
		treads.z_index = 0
	
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
	if movement_direction == "front":
		bumps.z_index = 0
	else:
		bumps.z_index = 0
		
#endregion

func _physics_process(_delta: float) -> void:
	move_and_slide()
