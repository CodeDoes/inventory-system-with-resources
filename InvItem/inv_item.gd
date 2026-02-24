extends Resource
class_name InvItem

@export var inv_name = "Inv Item"
@export_file("*.tscn") var handheld_tscn: String:
	set(v):
		handheld_tscn = v
		emit_changed()
@export_file("*.tscn") var world_tscn: String:
	set(v):
		world_tscn = v
		emit_changed()
