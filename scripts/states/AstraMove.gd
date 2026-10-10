extends State
class_name AstraMove

func enter():
	var astra = state_machine.get_parent()
	astra.moving = true


func physics_update(_delta):
	var astra = state_machine.get_parent()
	
	var _speed := 250
	var xDirection = Input.get_axis("left","right")
	var yDirection = Input.get_axis("front", "back")
	
	#define direction
	#region
	if xDirection > 0:
		xDirection = 1
		if yDirection == 0:
			astra.direction = "right"
	elif xDirection < 0:
		xDirection = -1
		if yDirection == 0:
			astra.direction = "left"
		
	if yDirection > 0:
		yDirection = 1
		if xDirection == 0:
			astra.direction = "back"
	elif yDirection < 0:
		yDirection = -1
		if xDirection == 0:
			astra.direction = "front"

	
	if xDirection == 0 and yDirection == 0:
		state_machine.change_state("AstraIdle")
		#endregion
	
	astra.velocity = (astra.baseSpeed*(Vector2(xDirection, yDirection).normalized()))


func exit():
	var astra = state_machine.get_parent()
	astra.velocity = Vector2.ZERO
	astra.moving = false
