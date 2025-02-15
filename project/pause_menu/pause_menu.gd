extends Control

func _ready():
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func resume():
	get_tree().paused = false
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func pause():
	get_tree().paused = true
	visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func testEsc():
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			resume()
		else:
			pause()


func _on_resume_pressed() -> void:
	resume()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_sleep_pressed() -> void:
	pass

func _process(delta):
	testEsc()
