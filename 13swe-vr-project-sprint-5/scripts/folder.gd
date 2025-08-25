extends "res://scripts/tree.gd"

@export var is_selected : bool = false
@export var is_root : bool = false

var lines : Array = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Checks if the current folder is the root, 
	# if so sets it to be the selected folder
	if is_root:
		is_selected = true

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_colourChanger()
	if is_selected:
		_update_lines()
	else:
		_clear_lines()


func _clear_lines() -> void:
	for line in lines:
		line.queue_free()
	lines.clear()


func _update_lines() -> void:
	_clear_lines()
	var parent_position = global_transform.origin
	
	for child in get_children():
		if child is Node3D:
			var line3d = line(parent_position, child.global_transform.origin)
			lines.append(line3d)


func line(pos1: Vector3, pos2: Vector3, color = Color.WHITE_SMOKE) -> MeshInstance3D:
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()

	mesh_instance.mesh = immediate_mesh
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(pos1)
	immediate_mesh.surface_add_vertex(pos2)
	immediate_mesh.surface_end()

	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = color
	
	get_tree().current_scene.add_child(mesh_instance)

	return mesh_instance


func _colourChanger() -> void:
	var mesh_instance = get_node("PickableObject/MeshInstance3D")
	# Get or duplicate the material
	var material : Material = mesh_instance.get_active_material(0)
	if material == null:
		material = mesh_instance.mesh.surface_get_material(0).duplicate()
	else:
		material = material.duplicate()

	# Apply the unique material
	mesh_instance.set_surface_override_material(0, material)

	# Change its albedo (base) color
	if material is StandardMaterial3D:
		if is_selected:
			material.albedo_color = Color(1, 0, 0) # red
		else:
			material.albedo_color = Color(0.7, 0.7, 0.7, 1.0)
