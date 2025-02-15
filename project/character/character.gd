extends CharacterBody3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 4.0  # movement speed
var jump_speed = 6.0  # determines jump height
var mouse_sensitivity = 0.002  # turning speed

var can_attack = true
var target_enemy = null

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
		
	if event.is_action_pressed("attack_melee"):
		if can_attack and target_enemy:
			print("Player - Attacking " + str(target_enemy))
			if target_enemy.has_method("hurt"):
				target_enemy.hurt()
		else:
			print("Player - Attacking nothing")

func _on_hit_box_body_entered(body: CharacterBody3D) -> void:
	print("Player - Enemy entered attack range")
	can_attack = true
	target_enemy = body

func _on_hit_box_body_exited(body: CharacterBody3D) -> void:
	if body == target_enemy:
		print("Enemy left attack range")
		can_attack = false
		target_enemy = null
