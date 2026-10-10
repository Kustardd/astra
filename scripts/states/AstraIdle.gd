extends State
class_name AstraIdle

func enter():
	pass

func handle_input(_event: InputEvent):
	if Input.is_action_pressed("back") or Input.is_action_pressed("left") or Input.is_action_pressed("front") or Input.is_action_pressed("right"):
		state_machine.change_state("AstraMove")
