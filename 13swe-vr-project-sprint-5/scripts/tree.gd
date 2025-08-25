extends Node3D

@export var nodeName : String = ""
var nodeSize : int = 0
var FILE = preload("res://scenes/file.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var num = 24
	#while num != 0:
		#createFile($"Folder&Files/Root")
		#num = num - 1
	pass
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func createFile(location) -> void:
	var newFile = FILE.instantiate()
	location.add_child(newFile)
