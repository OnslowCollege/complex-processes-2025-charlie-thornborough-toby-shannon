extends "res://scripts/tree.gd"

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
	
	self.add_child(mesh_instance)

	return mesh_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent_position = self.get_global_position()
	for child in self.get_children():
		var child_position = child.get_global_position()
		var line3d = line(parent_position, child_position)
		child.add_child(line3d)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in self.get_children():
		pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	pass # Replace with function body.
