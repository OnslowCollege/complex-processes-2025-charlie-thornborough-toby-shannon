extends Node3D

var children = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	children = get_children()
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func placeChecker() -> void:
	for child in children:
		if child.is_in_group("TreeNodes"):
			print("testy")
			child.position.z -= 1
