This guide provides a technical, step-by-step breakdown of your Godot 4 Reactive Inventory System. It covers node setup, project configurations, and code implementation, with specific markers for when to playtest.

---

### Step 1: Character Controller & Scene Architecture

**Goal:** Establish a 3D player body and set up "unbreakable" node referencing using Unique Names.

* **Project Settings:** Go to `Project -> Project Settings -> Input Map`. Add:
* `m_up` (W), `m_down` (S), `m_left` (A), `m_right` (D)
* `m_interact` (E), `m_next` (Wheel Up), `m_prev` (Wheel Down)


* **Node Setup:**
* `CharacterBody3D` (Player)
* `CollisionShape3D` (Capsule)
* `Node3D` (CameraOrigin)
* `Camera3D` (Right-click -> **Access as Unique Name: %Camera3D**)
* `RayCast3D` (Right-click -> **Access as Unique Name: %PickupRay**) -> Set `Target Position` to `(0, 0, -2)`.








* **The Code:**

```gdscript
extends CharacterBody3D
class_name Player

@export var move_speed = 5.0
@export var move_accel_mult = 10.0

func _physics_process(delta):
	_look_process(delta)
	_move_process(delta)
	_pickup_process() # Added in Step 4
	move_and_slide()

func _look_process(_delta):
	if Input.get_mouse_button_mask() != 0:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.is_key_pressed(KEY_ESCAPE):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED: return
	
	var look = -Input.get_last_mouse_velocity() / 50000.0
	rotate_y(look.x * TAU)
	%Camera3D.rotation.x = clamp(%Camera3D.rotation.x + look.y * TAU, -PI/2, PI/2)

func _move_process(delta):
	var move = Input.get_vector("m_left", "m_right", "m_up", "m_down")
	var desired = global_basis * Vector3(move.x, 0, move.y) * move_speed
	velocity = velocity.lerp(desired, move_accel_mult * delta)

```

* **▶️ PLAYTEST:** Confirm you can walk and look around with mouse capture.

---

### Step 2: The Data Layer (Custom Resources)

**Goal:** Define the data structure for items so they can exist independently of scenes.

* **The Code (`inv_item.gd`):**

```gdscript
extends Resource
class_name InvItem

@export var inv_name = "New Item"
@export_file("*.tscn") var handheld_tscn: String
@export_file("*.tscn") var world_tscn: String

```

* **Action:** Create a new resource in the FileSystem (`Flashlight.tres`). Give it a name. Link a placeholder `.tscn` to the `handheld_tscn` slot.

---

### Step 3: Reactive Inventory Variable

**Goal:** Use Setters to ensure the player visuals automatically update when the data changes.

* **The Code (Add to `player.gd`):**

```gdscript
signal inventory_changed
signal equip_index_changed(index: int)

@export var inventory: Array[InvItem] = []:
	set(v):
		inventory = v
		inventory_changed.emit()

var equip_index = 0:
	set(v):
		if inventory.size() > 0:
			equip_index = v % inventory.size() # Modulo for infinite scrolling
			equip_index_changed.emit(equip_index)
			update_handheld()

var handheld: Node
var equiped: InvItem:
	get: return inventory[equip_index] if equip_index < inventory.size() else null

func update_handheld():
	if handheld: handheld.queue_free()
	if not is_inside_tree(): await tree_entered
	if not equiped or not equiped.handheld_tscn: return
	
	handheld = load(equiped.handheld_tscn).instantiate()
	%Camera3D.add_child(handheld, true, Node.INTERNAL_MODE_FRONT)

```

* **▶️ PLAYTEST:** Drag your `Flashlight.tres` into the Player's Inventory array in the Inspector. Hit Play; the item should appear in your hand immediately.

---

### Step 4: World Interaction (Pickups)

**Goal:** Enable the player to transfer resources from 3D objects to their inventory array.

* **Node Setup (`world_object.gd`):**
* Create a `RigidBody3D` scene. Attach the script below.



```gdscript
extends RigidBody3D
class_name WorldObject
@export var invItem: InvItem

```

* **The Code (Add to `player.gd`):**

```gdscript
func _input(event):
	if event.is_action_pressed("m_next"): equip_index += 1
	if event.is_action_pressed("m_prev"): equip_index -= 1

func _pickup_process():
	if Input.is_action_just_pressed("m_interact"):
		if %PickupRay.is_colliding():
			var obj = %PickupRay.get_collider()
			if obj is WorldObject:
				inventory.append(obj.invItem)
				inventory = inventory # Force trigger the setter
				obj.queue_free()

```

* **▶️ PLAYTEST:** Place a `WorldObject` in the level. Walk up and press 'E'. It should disappear from the floor and appear in your hand.

---

### Step 5: The Reactive UI

**Goal:** Use the Observer Pattern to update the HUD via signals.

* **Node Setup:**
* Create a `CanvasLayer`. Add a `VBoxContainer` named `InvHud`.


* **The Code (`inventory_hud.gd`):**

```gdscript
extends VBoxContainer
@export var player: Player

func _ready():
	player.inventory_changed.connect(rebuild)
	player.equip_index_changed.connect(highlight_selection)

func rebuild():
	for child in get_children(): child.queue_free()
	for item in player.inventory:
		var lbl = Label.new()
		lbl.text = item.inv_name
		add_child(lbl)

func highlight_selection(index):
	for i in get_child_count():
		get_child(i).modulate = Color.YELLOW if i == index else Color.WHITE

```

* **▶️ PLAYTEST:** Open the HUD. Pick up an item and watch the list update. Scroll the mouse wheel and see the text highlight move.

---

### Core Principles for the Tutorial

1. **Decoupling:** Emphasize that the Player never tells the UI what to do; the UI just listens to the Player.
2. **Resource Power:** Explain that adding new items requires zero new code—just a new `.tres` file.
3. **Unique Names:** Remind the viewer that `%Camera3D` prevents "Node Not Found" errors if the scene hierarchy changes.