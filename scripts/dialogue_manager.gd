extends CanvasLayer

@onready var label: Label = $Label
@onready var bg = $ColorRect

@export var delay: float

var array : PackedStringArray = []

var dialogueIndex : int = -1#:
	#set(value):
		#dialogueIndex = value
		#label.visible_characters = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = ""
	bg.visible = false

	
func animate():
	label.visible_characters = 0
	if bg.visible == false:
		bg.visible = true
	if dialogueIndex < array.size():
		get_tree().paused = true
		label.text = array[dialogueIndex]
		delay = 2/label.text.length()
		for i in array[dialogueIndex].length():
			if i > 4 and Input.is_action_just_pressed("interact"):
				label.visible_characters = label.text.length() - 1
				break
			label.visible_characters += 1
			await get_tree().create_timer(delay).timeout
		label.visible_characters += 1		
		get_tree().paused = false
		#could be written better but it should work
	else: 
		dialogueIndex = -1
		bg.visible = false
		label.text = ""
		return
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if array:
			dialogueIndex += 1
			animate()
