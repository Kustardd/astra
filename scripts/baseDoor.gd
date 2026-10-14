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

var entered := false

func _ready() -> void:
	print("Changing scene to ", roomScene)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file.call_deferred(roomScene)
			print("Switched rooms")
			entered = false

func _on_body_entered(body: PhysicsBody2D) -> void:
	entered = true


func _on_body_exited(body: PhysicsBody2D) -> void:
	entered = false
