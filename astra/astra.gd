extends CharacterBody2D

@export var baseSpeed := 300.0
@export var baseAccel := 1500.0
@export var friction := 2000.0
@export var baseSpeedMultiplier := 1.5

@onready var anim_player: AnimatedSprite2D = $AnimatedSprite2D 
@onready var direction: String

enum Direction {
	Left,
	Right,
	Back,
	Front
}

#var currentState: State = State.Idle
#var currentDirection: Direction = Direction.Front

func _physics_process(delta: float) -> void:
	pass
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
