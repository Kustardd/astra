extends CanvasLayer

@onready var label: Label = $Label

@export var delay: float = 0.1

var array : PackedStringArray = []

var dialogueIndex : int = -1#:
	#set(value):
		#dialogueIndex = value
		#label.visible_characters = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = ""

	
func animate():
	label.visible_characters = 0
	if dialogueIndex < array.size():
		get_tree().paused = true
		for char in array[dialogueIndex]:
			label.text = array[dialogueIndex]
			label.visible_characters += 1
			await get_tree().create_timer(delay).timeout
		label.visible_characters += 1		
		get_tree().paused = false
		#could be written better but it should work
	else: 
		dialogueIndex = -1
		label.text = ""
		return
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if array:
			dialogueIndex += 1
			animate()
