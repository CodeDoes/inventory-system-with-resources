extends VBoxContainer
class_name InvHud
@export var player: Player


func _ready() -> void:
	player.inventory_changed.connect(inventory_changed)
	player.equip_index_changed.connect(equip_index_changed)
	inventory_changed()
	
func inventory_changed():
	for c in get_children():
		c.queue_free()
	for item in player.inventory:
		var hudItem: InvHudItem = preload("res://Player/InventoryHud/inventory_hud_item.tscn").instantiate()
		add_child(hudItem) 
		hudItem.invItem = item
	equip_index_changed(player.equip_index)

func equip_index_changed(equip_index:int):
	if equip_index>=get_child_count():
		return
	for c in get_children():
		(c as InvHudItem).selected = false
	(get_child(equip_index) as InvHudItem).selected = true
			
			
	
