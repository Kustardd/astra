extends Node

var interactable: bool
@export var dialogueArray: PackedStringArray
@onready var interactArea = get_node("Interact")
var dialogueManager: CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	interactArea.body_exited.connect(_on_body_exited)
	interactArea.body_entered.connect(_on_body_entered)


func _on_body_entered(body: PhysicsBody2D):
	interactable = true
	if body.dialogueManager:
		dialogueManager = body.dialogueManager
		dialogueManager.visible = true
		dialogueManager.array = dialogueArray

func _on_body_exited(body: PhysicsBody2D):
	interactable = false
	if dialogueManager and dialogueManager.array:
		dialogueManager.visible = false
		dialogueManager.array = []
	dialogueManager = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("interact"):
		#if interactable:
			#print(interactionDialogue)
	pass
