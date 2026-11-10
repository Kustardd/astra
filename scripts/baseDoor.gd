#region 
#extends Area2D
#
#var entered := false
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if entered == true:
		#if Input.is_action_just_pressed("interact"):
			#get_tree().change_scene_to_file("res://scenes/room_1.tscn")
#
#
#func _on_body_entered(body: PhysicsBody2D) -> void:
	#entered = true
#
#
#func _on_body_exited(body: Node2D) -> void:
	#entered = false
#endregion
extends Area2D

@export_file var roomScene: String

@export var keyName: String
@export var needsKey: bool = false

#means if astra entered the area
var entered := false

#if the scene is exiting
var exiting : bool = false

@onready var bigParentRoom = get_tree().root.get_child(1)
var astra : CharacterBody2D

@export var dialogueArray: PackedStringArray
@onready var interactArea = get_node("CollisionShape2D")
var dialogueManager: CanvasLayer

func _ready() -> void:
	print("Changing scene to ", roomScene.get_basename())

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if astra:
		print(astra.keysArray)
	pass
	
func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true
	astra = body
	astra.eForInteract.visible = true


func _on_body_exited(_body: CharacterBody2D) -> void:
	astra.eForInteract.visible = false
	entered = false
	astra = null
	
func dialogue():
	if astra.dialogueManager:
		dialogueManager = astra.dialogueManager
		dialogueManager.visible = true
		dialogueManager.array = dialogueArray

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if entered == true:
			if needsKey:
				for key in astra.keysArray:
					if key.to_lower() == keyName.to_lower():
						dialogueArray = []
						exiting = true
						bigParentRoom.exitScene(roomScene)
						print("Switched rooms")
						entered = false
				if not exiting:
					dialogueArray = ["You don't have the key.", "Try searching around."]
					dialogue()
			else:
				exiting = true
				bigParentRoom.exitScene(roomScene)
				print("Switched rooms")
				entered = false
