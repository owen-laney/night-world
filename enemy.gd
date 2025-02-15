extends CharacterBody3D

var hp = 40
var initial_hp = hp
var damage_amount = 10

signal hp_changed(old_value, new_value)
signal total_hp(initial_hp)
signal near_character(is_near_character: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	total_hp.emit(initial_hp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hurt():
	if hp > 0:
		var old_hp = hp
		hp -= damage_amount
		
		print("Enemy - health remaining: " + str(hp))
		hp_changed.emit(old_hp, hp)
	if hp == 0:
		print("Enemy - Died")


func _on_character_nearby(is_nearby: bool) -> void:
	if is_nearby:
		near_character.emit(true)
	else:
		near_character.emit(false)
