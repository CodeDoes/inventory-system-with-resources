@tool
extends Control
class_name InvHudItem

@export var invItem: InvItem:
	set(v):
		invItem = v
		changed()
@export var selected = false:
	set(v):
		selected = v
		changed()

func changed():
	if not is_inside_tree():
		await tree_entered
	if invItem:
		$Label.text = invItem.inv_name
	$ColorRect.modulate.a = 1 if selected else 0
	
