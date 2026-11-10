extends Node

var interactable: bool

@export var dialogueArray: PackedStringArray
@onready var interactArea = get_node("Interact")
var dialogueManager: CanvasLayer
var astra: CharacterBody2D

@export var hasKey: bool
@export var keyName: String

#really bad way to determine which direction astra should be facing to be interacted with but wtv
@export var facingLeft: bool
@export var facingRight: bool
@export var facingFront: bool
@export var facingBack: bool
var facingUniversal: bool = true



# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	facingUniversal = !(facingLeft or facingRight or facingBack or facingFront)
	interactArea.body_exited.connect(_on_body_exited)
	interactArea.body_entered.connect(_on_body_entered)


func _on_body_entered(body: CharacterBody2D):
	astra = body
	if facingUniversal:
		interactable = true
		astra.eForInteract.visible = true
		if astra.dialogueManager:
			dialogue()
	else:
		if astra.direction:
			if facingLeft and astra.direction == "left":
				interactable = true
				astra.eForInteract.visible = true
				dialogue()
			elif facingRight and astra.direction == "right":
				interactable = true
				astra.eForInteract.visible = true
				dialogue()
			elif facingFront and astra.direction == "front":
				interactable = true
				astra.eForInteract.visible = true
				dialogue()
			elif facingBack and astra.direction == "back":
				interactable = true
				astra.eForInteract.visible = true
				dialogue()

func _on_body_exited(body: CharacterBody2D):
	astra.eForInteract.visible = false
	astra = null
	interactable = false
	if dialogueManager and dialogueManager.array:
		dialogueManager.visible = false
		dialogueManager.array = []
	dialogueManager = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if astra and astra.eForInteract:
		if !interactable:
			astra.eForInteract.visible = false
		print(astra.eForInteract.visible, interactable)
	
func dialogue():
	if astra.dialogueManager:
		dialogueManager = astra.dialogueManager
		dialogueManager.visible = true
		dialogueManager.array = dialogueArray
		astra.keysArray.append(keyName)
