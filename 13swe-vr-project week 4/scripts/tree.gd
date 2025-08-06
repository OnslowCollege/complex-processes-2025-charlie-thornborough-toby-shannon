extends Node3D

@export var nodeName : String = ""
var nodeSize : int = 0
var children = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	children = get_children()
	print(children)
	
	for child in children:
		if child is Node3D:
			print("testy")
			child.position.y + 2
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
