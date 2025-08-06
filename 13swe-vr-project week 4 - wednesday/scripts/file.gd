extends "res://scripts/tree.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	placeChecker()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_area_entered(area: Area3D) -> void:
	self.position.x -= 1
