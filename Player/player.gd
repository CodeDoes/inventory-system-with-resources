@tool
extends CharacterBody3D
class_name Player

signal inventory_changed()
signal equip_index_changed(index:int)
var handheld:HandHeld

@export_range(0,0,1,"or_greater") var equip_index=0:
	get():
		return equip_index
	set(v):
		if inventory:
			equip_index = v % inventory.size()
		equip_index_changed.emit(v)
		update_handheld()
		
@export var inventory:Array[InvItem] = []:
	set(v):
		inventory = v
		inventory_changed.emit()
		update_handheld()
		
var equiped:InvItem:
	get():
		if equip_index > inventory.size():
			return null
		return inventory[equip_index]
var move_speed = 10.0
var move_accel_mult = 2.0


func update_handheld():
	print("handheld")
	if handheld:
		handheld.queue_free()
	if not is_inside_tree():
		await tree_entered
	handheld = load(equiped.handheld_tscn).instantiate()
	%Camera3D.add_child(handheld,true,Node.INTERNAL_MODE_FRONT)
	

func _look_process(_delta:float):
	
	if Input.get_mouse_button_mask()!=0:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.is_key_pressed(KEY_ESCAPE):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
		return
	var look = -Input.get_last_mouse_velocity().limit_length(50000.0) / 50000.0
	rotate_y(look.x * TAU)
	var camBasis:Basis = %Camera3D.basis
	
	%Camera3D.rotation.x = clampf(%Camera3D.rotation.x + look.y * TAU,-PI/3*2,PI/3*2)

func _move_process(delta:float):
	var move = Input.get_vector("m_left","m_right","m_up","m_down")
	var desired = global_basis * Vector3(move.x,0,move.y) * move_speed
	var diff = (desired - velocity).limit_length(move_speed * move_accel_mult * delta)
	velocity += diff 

func _pickup_process():
	if not Input.is_action_just_pressed("m_interact"):
		return
	var other = %PickupRay.get_collider()
	if other is WorldObject:
		inventory.append(other.invItem)
		inventory_changed.emit()
		other.queue_free()
		
	
func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint()	:
		return 
	_look_process(delta)
	_move_process(delta)
	_pickup_process()
	move_and_slide()
	apply_floor_snap()
	if Input.is_action_just_pressed("i_up"):
		equip_index += 1
	if Input.is_action_just_pressed("i_down"):
		equip_index -= 1
