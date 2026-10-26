extends Sprite2D

#@onready var astra = get_node("Astra")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if astra.eVisibility != self.visible:
		#self.visible = astra.eVisibility
	pass

func _on_item_detection_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	self.visible = true


func _on_item_detection_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	self.visible = false
