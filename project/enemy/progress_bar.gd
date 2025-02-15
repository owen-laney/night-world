extends ProgressBar


# Called when the node enters the scene tree for the first time.	
func _ready() -> void:
	pass
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_hp_changed(old_value: Variant, new_value: Variant) -> void:
	value = new_value


func _on_enemy_total_hp(initial_hp: Variant) -> void:
	max_value = initial_hp
	value = initial_hp
	print("Max value: " + str(max_value))


func _on_enemy_near_character(is_near_character: bool) -> void:
	if is_near_character:
		visible = true
	else:
		visible = false
