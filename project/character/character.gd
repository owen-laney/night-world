extends CharacterBody3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 4.0  # movement speed
var jump_speed = 6.0  # determines jump height
var mouse_sensitivity = 0.002  # turning speed
var mouse_captured = true

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func get_input():
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = movement_dir.x * speed
	velocity.z = movement_dir.z * speed
	

func _physics_process(delta):
	velocity.y += -gravity * delta
	get_input()
	move_and_slide()

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

#func _input(event):
	#if event.is_action_pressed("ui_cancel"):
		#toggle_mouse_capture()
#
#func toggle_mouse_capture():
	#mouse_captured = !mouse_captured  # Toggle the state
	#if mouse_captured:
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Lock the mouse
		#print("Mouse Captured")
		##get_tree().paused = false
	#else:
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Release the mouse
		#print("Mouse Released")
		##get_tree().paused = true
