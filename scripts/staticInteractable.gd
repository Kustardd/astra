extends Node

@export var dialogueTrue: bool
var interactable: bool
@export var interactionDialogue: String
@onready var interactArea = get_node("Interact")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#interactArea.monitorable = false

	interactArea.body_exited.connect(_on_body_exited)
	interactArea.body_entered.connect(_on_body_entered)


func _on_body_entered(body: PhysicsBody2D):
	interactable = true
	#var astra = $Rendering/Astra
	#astra.eVisibility = true
	#print(astra.eVisibility)
	#print("hello")


func _on_body_exited(body: PhysicsBody2D):
	interactable = false
	#var astra = $Rendering/Astra
	#astra.eVisibility = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if interactable:
			print(interactionDialogue)
