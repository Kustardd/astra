extends State
class_name AstraMove

func enter():
	pass
	
func physics_update(delta):
	var speed := 250
	var astra = state_machine.get_parent()
	var xDirection = Input.get_axis("left","right")
	var yDirection = Input.get_axis("front", "back")
	var direction : String
	
	#define direction
	#region
	if xDirection > 0:
		xDirection = 1
		direction = "right"
	elif xDirection < 0:
		xDirection = -1
		direction = "left"
		
	if yDirection > 0:
		yDirection = 1
		direction = "front"
	elif yDirection < 0:
		yDirection = -1
		direction = "back"

	
	if xDirection == 0 and yDirection == 0:
		state_machine.change_state("AstraIdle")
		#endregion
	
	astra.direction = direction
	
	astra.position += (200*(Vector2(xDirection, yDirection).normalized())*delta)
