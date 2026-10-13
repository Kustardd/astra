extends Area2D

var entered := false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://scenes/room_1.tscn")


func _on_body_entered(body: PhysicsBody2D) -> void:
	entered = true


func _on_body_exited(body: Node2D) -> void:
	entered = false
