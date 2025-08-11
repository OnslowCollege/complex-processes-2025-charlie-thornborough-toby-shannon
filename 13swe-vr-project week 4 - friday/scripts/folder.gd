extends "res://scripts/tree.gd"

var branches : Array[Node] = []


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	placeChecker()


func _on_area_3d_area_entered(area: Area3D) -> void:
	self.position.x -= 2


func placeChecker() -> void:
	for branch in branches:
		if branch.is_in_group("TreeNodes"):
			print("testy")
			branch.position.z -= 1
